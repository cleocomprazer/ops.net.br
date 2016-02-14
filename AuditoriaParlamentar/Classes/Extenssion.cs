using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace AuditoriaParlamentar.Classes
{
    public static class Extenssion
    {
        public static string SelectedItems(this ListControl lc)
        {
            List<string> selectedItems =
                        lc.Items.Cast<ListItem>()
                        .Where(item => item.Selected == true)
                        .Select(item => item.Text)
                        .ToList();

            return string.Join(",", selectedItems);
        }

        public static void SelectedItems(this ListControl lc, string strItens)
        {
            var lstItens = strItens.Split(',');

            foreach (ListItem item in lc.Items)
            {
                item.Selected = lstItens.Contains(item.Value);
            }
        }
    }
}