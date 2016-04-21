/* Google Analytics */
try {
	(function (i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date(); a = s.createElement(o),
        m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-38537890-5', 'auto');
	ga('send', 'pageview');
} catch (e) { }

/* PesquisaPrincipal.aspx */

function loadPesquisaPrincipal() {
	$('#DropDownListPerido').change(function () {
		if ($(this).val() == 'Informar Período') {
			$('.periodo').show();
		} else {
			$('.periodo').hide();
		}
	}).trigger('change');

	$('.selectpicker').selectpicker({
		width: '100%'
	});

	LoadPopoverAuditoria();
};

function NovoNivel(value, descricao, agrupamento) {
	if ($("#LabelFiltro").length == 0) {
		//PesquisaPrincipal.aspx
		var desc = $('#DropDownListAgrupamento').val().substring(4).toUpperCase() + ": " + descricao;

		window.parent.TabPesquisa(
            value,
            desc,
            agrupamento,
            $("#DropDownListGrupo").val(),
            $("#DropDownListAgrupamento").val(),
            $("#CheckBoxSepararMes").is(':checked'),
            $("#DropDownListPerido").val(),
            $("#DropDownListAnoInicial").val(),
            $("#DropDownListMesInicial").val(),
            $("#DropDownListAnoFinal").val(),
            $("#DropDownListMesFinal").val(),
            $("#DropDownListParlamentar").val(),
            $("#DropDownListDespesa").val(),
            $("#txtFornecedor").val(),
            $("#DropDownListUF").val(),
            $("#DropDownListPartido").val(),
            ''
        );
	} else {
		//PesquisaResultado.aspx
		var desc = $("#LabelFiltro").text() + " > " + $("#HiddenFieldAgrupamento").val().substring(4).toUpperCase() + ": " + descricao;

		window.parent.TabPesquisa(
            value,
            desc,
            agrupamento,
            $("#HiddenFieldGrupo").val(),
            $("#HiddenFieldAgrupamento").val(),
            $("#HiddenFieldSeparaMes").val(),
            $("#HiddenFieldPeriodo").val(),
            $("#HiddenFieldAnoIni").val(),
            $("#HiddenFieldMesIni").val(),
            $("#HiddenFieldAnoFim").val(),
            $("#HiddenFieldMesFim").val(),
            $("#HiddenFieldParlamentar").val(),
            $("#HiddenFieldDespesa").val(),
            $("#HiddenFieldFornecedor").val(),
            $("#HiddenFieldUF").val(),
            $("#HiddenFieldPartido").val(),
            $("#HiddenFieldDocumento").val());
	}
}

function UpdateGridView(row, column, value) {
	var grd = document.getElementById('GridViewResultado');
	grd.rows[row].cells[column].textContent = value;
}

function LimparFiltros() {
	$("#DropDownListGrupo").val('Deputado Federal');
	$("#DropDownListAgrupamento").val('Por Parlamentar');
	$("#CheckBoxSepararMes").removeAttr('checked');
	$("#DropDownListPerido").val('Mês Atual').trigger('change');
	$("#DropDownListParlamentar").selectpicker('deselectAll');
	$("#DropDownListDespesa").selectpicker('deselectAll');
	$("#txtFornecedor").val('');
	$("#DropDownListUF").selectpicker('deselectAll');
	$("#DropDownListPartido").selectpicker('deselectAll');
}

/* PesquisaPrincipal.aspx */
//var mFiltro = "";
//var mDescricao = "";
//var mGrupo = "";
//var mAgrupamentoAtual = "";
//var mSeparaMes = "";
//var mPeriodo = "";
//var mAnoIni = "";
//var mMesIni = "";
//var mAnoFim = "";
//var mMesFim = "";
//var mParlamentar = "";
//var mDespesa = "";
//var mFornecedor = "";
//var mUF = "";
//var mPartido = "";
//var mDocumento = "";

var tabTemplate = "<li><a href='#{href}' data-toggle='tab'>#{label}&nbsp;<i class='tab-close glyphicon glyphicon-remove' title='Fechar'></i></a></li>";
var frameTemplate = "<div id='#{id}' class='tab-pane'><iframe src='#{src}' frameborder='0' width='100%'/></div>"
var tabCounter = 1;
var idCounter = 1;

function loadPesquisaAbas() {
	// modal dialog init: custom buttons and a "close" callback reseting the form inside
	//var $dialog = $('#modal-agrupamento');
	//$dialog.on('hidden.bs.modal', function (e) {
	//    form[0].reset();
	//})

	//$('.acao-agrupamento').click(function () {
	//    addTabPesquisa($(this).attr('value'));
	//    $dialog.modal('hide');
	//});

	//// addTab form: calls addTab function on submit and closes the dialog
	//var form = $("form").submit(function (event) {
	//    addTabPesquisa();
	//    $dialog.dialog("hide");
	//    event.preventDefault();
	//});

	var tabs = $("#tabs").tab();

	// close icon: removing the tab on click
	tabs.delegate("i.tab-close", "click", function (e) {
		//console.log('fechar aba')
		var $tab = $(this).parent();
		$($tab.attr('href')).remove();
		$tab.parent().remove();
		tabCounter--;

		if ($('#tabs li.active').length == 0)
			$('#tabs li:eq(' + (tabCounter - 1) + ') a').tab('show');
	});
};

function closeTab() {
	var $tabs = $("#tabs").find("li.active");
	$($tabs.find('a').attr('href')).remove();
	$tabs.remove();

	tabCounter--;
	if ($('#tabs li.active').length == 0)
		$('#tabs li:eq(' + (tabCounter - 1) + ') a').tab('show');
}

function addTab(titulo, src) {
	var id = "tabs-" + idCounter;
	var li = $(tabTemplate.replace(/#\{href\}/g, "#" + id).replace(/#\{label\}/g, Left(titulo, 20)));

	$('#tab-content').append(frameTemplate.replace(/#\{id\}/g, id).replace(/#\{src\}/g, src));
	var $tabs = $('#tabs');
	$tabs.append(li);
	//$tabs.unbind().tab();
	$tabs.find('a:last').tab('show');
}

function Left(str, n) {
	if (n <= 0)
		return "";
	else if (n > String(str).length)
		return str;
	else
		return String(str).substring(0, n);
}

// actual addTab function: adds new tab using the input from the form above
//function addTabPesquisa(agrupamentoNovo) {
//    tabCounter++;
//    idCounter++;

//    var src = "PesquisaResultado.aspx?id=" + idCounter +
//        "&filtro=" + mFiltro +
//        "&descricao=" + mDescricao +
//        "&grupo=" + (mGrupo || '') +
//        "&agrupamentoAtual=" + (mAgrupamentoAtual || '') +
//        "&agrupamentoNovo=" + (agrupamentoNovo || '') +
//        "&separaMes=" + mSeparaMes +
//        "&periodo=" + (mPeriodo || '') +
//        "&anoIni=" + (mAnoIni || '') +
//        "&mesIni=" + (mMesIni || '') +
//        "&anoFim=" + (mAnoFim || '') +
//        "&mesFim=" + (mMesFim || '') +
//        "&parlamentar=" + (mParlamentar || '') +
//        "&despesa=" + (mDespesa || '') +
//        "&fornecedor=" + (mFornecedor || '') +
//        "&uf=" + (mUF || '') +
//        "&partido=" + (mPartido || '') +
//        "&documento=" + (mDocumento || '');

//    addTab(agrupamentoNovo, src);
//}

function addTabAuditoria(tipo, valor) {
	tabCounter++;
	idCounter++;

	var src;
	if (tipo == "J") {
		src = 'AuditoriaFornecedor.aspx?codigo=' + valor;
	}
	else {
		src = 'AuditoriaPF.aspx?codigo=' + valor;
	}

	addTab("Auditoria", src);
}

function addTabDenuncia(cnpj, nome) {
	tabCounter++;
	idCounter++;

	var src = "DenunciarFornecedor.aspx?Cnpj=" + cnpj + "&Nome=" + nome;

	addTab("Denúncia", src);
}

function addTabDoacao(cnpj, nome) {
	tabCounter++;
	idCounter++;

	var src = "ReceitasEleicao.aspx?Cnpj=" + cnpj + "&Nome=" + nome;

	addTab("Doações", src);
}

function addTabDocumentos(cnpj, nome, tipo) {
	tabCounter++;
	idCounter++;

	var title = "";
	var pag = "";

	if (tipo == 0) {
		title = "Parlamentares";
		pag = "FornecedorParlamentares.aspx";
	}
	else {
		title = "Documentos";
		pag = "SolicitaDocumentos.aspx";
	}

	var src = pag + "?Cnpj=" + cnpj + "&Nome=" + nome;

	addTab(title, src);
}

function TabPesquisa(filtro, descricao, agrupamentoNovo, grupo, agrupamentoAtual, separaMes, periodo, anoIni, mesIni, anoFim, mesFim, parlamentar, despesa, fornecedor, uf, partido, documento) {
	tabCounter++;
	idCounter++;

	var src = "PesquisaResultado.aspx?id=" + idCounter +
        "&filtro=" + filtro +
        "&descricao=" + descricao +
        "&grupo=" + (grupo || '') +
        "&agrupamentoAtual=" + (agrupamentoAtual || '') +
        "&agrupamentoNovo=" + (agrupamentoNovo || '') +
        "&separaMes=" + separaMes +
        "&periodo=" + (periodo || '') +
        "&anoIni=" + (anoIni || '') +
        "&mesIni=" + (mesIni || '') +
        "&anoFim=" + (anoFim || '') +
        "&mesFim=" + (mesFim || '') +
        "&parlamentar=" + (parlamentar || '') +
        "&despesa=" + (despesa || '') +
        "&fornecedor=" + (fornecedor || '') +
        "&uf=" + (uf || '') +
        "&partido=" + (partido || '') +
        "&documento=" + (documento || '');

	addTab(agrupamentoNovo, src);
}

function AlertaSemCnpj() {
debugger
	$("#dialog-message").dialog({
		modal: true,
		autoOpen: true,
		height: 500,
		width: 800,
		buttons: {
			Ok: function () {
				$(this).dialog("close");
			}
		}
	});

	$('body,html', window.parent.parent.document).animate({ scrollTop: 0 }, 600);
}

function TabDenuncia(cnpj, nome) {
	addTabDenuncia(cnpj, nome);
}
function TabDoacoes(cnpj, nome) {
	addTabDoacao(cnpj, nome);
}

/* AuditoriaFornecedor.aspx */
function loadAuditoriaFornecedor() {
	$("#buscar-captcha-btn").on("click", function (e) {
		e.preventDefault();

		$("#captcha_img").fadeOut(1000, function () {
			$(this).attr('src', "");
			BuscarCaptcha();
		});

	});

	$("#buscarDados-btn").on("click", function () {
		if ($("#img-input").val()) {
			ObterDados();
		} else {
			alert('Digite o texto da imagem!');
			$("#img-input").focus();
		}
	});

	$('#ButtonMaps').click(function (e) {
		e.preventDefault();
		window.open("http://maps.google.com/?q=" +
            $('#lblLogradouro').text() + ',' +
            $('#lblNumero').text() + ',' +
            $('#lblCep').text().replace(".", "") + ',' +
            $('#lblUf').text() + ',Brasil');
	});

	$('#ButtonPesquisa').click(function (e) {
		e.preventDefault();
		window.open("http://www.google.com.br/search?q=" +
            $('#lblRazaoSocial').text() + ',' +
            $('#lblCidade').text() + ',' +
            $('#Uf').text());
	});

	$('#ButtonAtualizar').click(function (e) {
		e.preventDefault();

		ReconsultarDadosReceita();
	});

	$('#ButtonDenunciar').click(function (e) {
		e.preventDefault();
		window.parent.TabDenuncia($("#lblCNPJ").text(), $("#lblRazaoSocial").text());
	});

	$('#ButtonListarDoacoes').click(function (e) {
		e.preventDefault();
		window.parent.TabDoacoes($("#lblCNPJ").text(), $("#lblRazaoSocial").text());
	});

	$('#ButtonListarDeputados').click(function (e) {
		e.preventDefault();
		window.parent.addTabDocumentos($("#lblCNPJ").text(), $("#lblRazaoSocial").text(), 0);
	});

	$('#ButtonListarDocumentos').click(function (e) {
		e.preventDefault();
		window.parent.addTabDocumentos($("#lblCNPJ").text(), $("#lblRazaoSocial").text(), 1);
	});
};

function ReconsultarDadosReceita() {
	BuscarCaptcha();

	$("#fsConsultaReceita").show();
};

var $loader = $('<img class="loader-facebook" src="assets/img/ajax-loader-facebook.gif"/> <em>Buscando ...</em>');

var BuscarCaptcha = function () {
	var strUrl = 'AuditoriaFornecedor.aspx/GetCaptcha';
	$.ajax({
		type: 'post',
		url: strUrl,
		data: {},
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		cache: false,
		async: true,
		beforeSend: function () {
			$loader.insertAfter($("#captcha_img"));
		},
		success: function (data) {
			$("#captcha_img").removeClass("hidden").attr('src', data.d).fadeIn(1000);
			$('#img-input').val('').focus();
		},
		complete: function () {
			$loader.remove();
			$("#img-input").focus();
		},
		error: function (err) {
			alert("erro na tentativa de obter o captcha");
		}
	});
};

var ObterDados = function () {
	var strUrl = 'AuditoriaFornecedor.aspx/ConsultarDados';
	$.ajax({
		type: 'post',
		url: strUrl,
		cache: false,
		async: true,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		data: JSON.stringify({ "cnpj": $("#lblCNPJ").text(), "captcha": $("#img-input").val() }),
		beforeSend: function () {
			$loader.insertBefore($("#fechar-button"));
		},
		success: function (data) {
			$loader.remove();
			if (data.d.erro.length > 0) {
				$("#msgErro-span").text(data.d.erro).closest("p").removeClass("hidden");
				$("#captcha_img").fadeOut(1000, function () {
					$(this).attr('src', "");
					BuscarCaptcha();
					$("#img-input").focus();
				});
				setTimeout(function () {
					$("#msgErro-span").closest("p").addClass("hidden");
				}, 2000);
			} else {
				if (data.d.dados != null) {
					PreencheDados(data.d.dados, false);
					$("#buscar-modal").modal("hide");

					$("#fsConsultaReceita, #dvInfoDataConsultaCNPJ").hide();
					$("#fsDadosReceita, #fsQuadroSocietario, #dvBotoesAcao").show();

				} else {
					$("#msgErro-span").text("erro de comunicação com a receita.").closest("p").removeClass("hidden");
					$("#captcha_img").fadeOut(1000, function () {
						$(this).attr('src', "");
						BuscarCaptcha();
						$("#img-input").focus();
					});
					setTimeout(function () {
						$("#msgErro-span").closest("p").addClass("hidden");
					}, 2000);
				}

			}
		},
		error: function (data) {
			$loader.remove();
			if (data.responseJSON && data.responseJSON.Message) {
				alert(data.responseJSON.Message);
				BuscarCaptcha();
			} else {
				alert("erro de comunicação.");
			}
		},
	});
};

var PreencheDados = function (dados) {
	$("#lblCNPJ").text(dados.Cnpj);
	$("#lblRazaoSocial").text(dados.RazaoSocial);
	$("#lblNomeFantasia").text(dados.NomeFantasia);
	$("#lblAtividadePrincipal").text(dados.AtividadePrincipal);
	$("#lblLogradouro").text(dados.Logradouro);
	$("#lblNumero").text(dados.Numero);
	$("#lblComplemento").text(dados.Complemento);
	$("#lblBairro").text(dados.Bairro);
	$("#lblCep").text(dados.Cep);
	$("#lblCidade").text(dados.Cidade);
	$("#lblUf").text(dados.Uf);
	$("#lblSituacaoCadastral").text(dados.Situacao);
	$("#lblDataSituacaoCadastral").text(dados.DataSituacao);
	$("#lblMotivoSituacaoCadastral").text(dados.MotivoSituacao);
	$("#lblCodigoDescricaoNaturezaJuridica").text(dados.NaturezaJuridica);
	$("#lblEmail").text(dados.Email);
	$("#lblTelefone").text(dados.Telefone);
	$("#lblEnteFederativoResponsavel").text(dados.EnteFederativoResponsavel);
	$("#lblDataAbertura").text(dados.DataAbertura);
	$("#lblSituacaoEspecial").text(dados.SituacaoEspecial);
	$("#lblDataSituacaoEspecial").text(dados.DataSituacaoEspecial);
	$("#lblAtividadeSecundaria").html(dados.AtividadeSecundaria01);
	$("#lblCapitalSocial").html(dados.CapitalSocial);

	var str = '';
	for (var i = 0; i < dados.lstFornecedorQuadroSocietario.length; i++) {
		str += '<tr><td>' + dados.lstFornecedorQuadroSocietario[i].Nome + '</td>' +
            '<td>' + dados.lstFornecedorQuadroSocietario[i].Qualificacao + '</td>' +
            '<td>' + (dados.lstFornecedorQuadroSocietario[i].NomeRepresentanteLegal || '') + '</td>' +
            '<td>' + (dados.lstFornecedorQuadroSocietario[i].QualificacaoRepresentanteLegal || '') + '</td></tr>';
	}
	if (str == '') {
		str = '<td colspan="4" class="text-center">A natureza jurídica não permite o preenchimento do QSA</td>';
	}

	$('#tbQuadroSocietario tbody').html(str);
};

/* AuditoriaPF.aspx */
function loadAuditoriaPF() {
	$("#dialog-message").dialog({
		modal: true,
		autoOpen: false,
		height: 500,
		width: 800,
		buttons: {
			Ok: function () {
				$(this).dialog("close");
			}
		}
	});
};

function ExibeOqueProcurar() {
	$("#dialog-message").dialog("open");
}

function Denunciar() {
	window.parent.TabDenuncia($('#LabelCNPJ').text(), $('#LabelRazaoSocial').text());
}

function Doacoes() {
	window.parent.TabDoacoes($('#LabelCNPJ').text(), $('#LabelRazaoSocial').text());
}

/* CidadesPendencia.aspx */
function loadCidadesPendencia() {
	//$('#frame').get(0).contentWindow
	var $frame = $('#frame');
	var heightTop = $frame.offset().top;
	$frame.height(window.innerHeight - heightTop);

	//And if the outer div has no set specific height set.. 
	$(window).resize(function () {
		$frame.css('height', window.innerHeight - heightTop);
	});
};

/* PesquisaResultado.aspx */
function UpdateGridView(row, column, value) {
	var grd = document.getElementById('GridViewResultado');
	grd.rows[row].cells[column].textContent = value;
}

/* ChangePassword.aspx */
function loadChangePassword() {
	var $alert = $('#MainContent_ChangeUserPassword_ChangePasswordContainerID_dvFailureText');
	if ($alert.find('span').text().trim())
		$alert.show();
}

/* Login.aspx */
function loadLogin() {
	var $alert = $('#MainContent_LoginUser_dvFailureText');
	if ($alert.find('span').text().trim())
		$alert.show();
}

/* Register.aspx */
function loadRegister() {
	var $alert = $('#MainContent_RegisterUser_CreateUserStepContainer_dvErrorMessage');
	if ($alert.find('span').text().trim())
		$alert.show();
}

/* NovaNoticia.aspx */
function loadNovaNoticia() {
	//Specifying the Character Count control explicitly
	$("[id*=TextBoxNoticia]").MaxLength(
    {
    	MaxLength: 255,
    	CharacterCountControl: $('#counterTexto')
    });

	$("[id*=TextBoxLink]").MaxLength(
    {
    	MaxLength: 255,
    	CharacterCountControl: $('#counterLink')
    });
};

function AnexoValidation(source, args) {
	args.IsValid = $("#FileUpload").val() != '';
}

/* PesquisaResultado.aspx */
function loadPesquisaResultado() {
	LoadPopoverAuditoria();
}

function LoadPopoverAuditoria() {
	$('.popover-link').each(function () {
		$(this).popover({
			html: true,
			trigger: 'manual',
			content: function () {
				return $('#popover_content_wrapper').html();
			}
		}).click(function (e) {
			e.preventDefault();
			$('.popover').popover('hide');

			$(this).popover('toggle');
			$('.popover .btn').click(function (e) {
				var agrupamento = this.value;
				if (agrupamento !== 'Cancelar') {
					var popover_content_id = $(this).closest('.popover').prop('id');
					var $buttonDetalhar = $('a.popover-link[aria-describedby="' + popover_content_id + '"]');

					var valor = $buttonDetalhar.data('valor');
					var descricao = $buttonDetalhar.data('descricao');

					NovoNivel(valor, descricao, agrupamento);
				}

				$(this).parents('.popover').popover('hide');
			});
		});
	});
}

//Aba Deputado Federal
function adf(link, id) {
	window.parent.addTabDeputado(link.innerText, id);
};

function addTabDeputado(nome, id) {
	tabCounter++;
	idCounter++;

	addTab("Dep. " + nome, 'DeputadoFederal.aspx?id=' + id);
}

//Aba Fornecedor
function af(element, posCodigo, posNome) {
	var $lstTD = $(element).closest('tr').find('td');
	window.parent.addTabAuditoria($lstTD.eq(posCodigo).text(), $lstTD.eq(posNome).text());
};

function addTabAuditoria(codigo, nome) {
	tabCounter++;
	idCounter++;

	var src = (codigo.length == 11 ? 'AuditoriaPF.aspx?codigo=' : 'AuditoriaFornecedor.aspx?codigo=') + codigo;
	addTab(Left(nome, 20), src);
}