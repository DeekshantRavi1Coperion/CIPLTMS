using System;
using System.Text;
using System.Data;


public class PurchaseVouchersHtmlForPDF
{
    #region Variables

    string VoucherNo = string.Empty;
    string VoucherDate = string.Empty;
    string VoucherCreatedBy = string.Empty;
    string VoucherType = string.Empty;
    string Unit = string.Empty;

    int AuthorizedById = 0;
    string AuthorizedBy = string.Empty;
    string AuthorizedOn = string.Empty;
    string AuthorizedRemarks = string.Empty;

    int ApprovedById = 0;
    string ApprovedBy = string.Empty;
    string ApprovedOn = string.Empty;
    string ApprovedRemarks = string.Empty;
    private string ChallanNo = string.Empty;
    private string ChallanDate = string.Empty;
    private string PurchaseOrderNo = string.Empty;
    private string PurchaseOrderDate = string.Empty;
    private string VendorName = string.Empty;
    private string DOCClass = string.Empty;
    private string VendorCode = string.Empty;
    private string NetAmount = "0";

    #endregion


    public string GetHtmlForPDF(DataSet dsDetails)
    {
        try
        {
            if (dsDetails.Tables.Count > 0 && dsDetails.Tables[0].Rows.Count > 0)
            {
                DataRow dr0 = dsDetails.Tables[0].Rows[0];

                if (dr0["VOUCHER_NO"] != DBNull.Value) VoucherNo = Convert.ToString(dr0["VOUCHER_NO"]).Trim();
                if (dr0["VOUCHER_DATE"] != DBNull.Value) VoucherDate = Convert.ToString(dr0["VOUCHER_DATE"]).Trim();

                if (dr0["CHALLAN_NO"] != DBNull.Value) ChallanNo = Convert.ToString(dr0["CHALLAN_NO"]).Trim();
                if (dr0["CHALLAN_DATE"] != DBNull.Value) ChallanDate = Convert.ToString(dr0["CHALLAN_DATE"]).Trim();
                if (dr0["PURCHASE_ORDER_NO"] != DBNull.Value) PurchaseOrderNo = Convert.ToString(dr0["PURCHASE_ORDER_NO"]).Trim();
                if (dr0["PURCHASE_ORDER_DATE"] != DBNull.Value) PurchaseOrderDate = Convert.ToString(dr0["PURCHASE_ORDER_DATE"]).Trim();
                if (dr0["DOC_CLASS"] != DBNull.Value) DOCClass = Convert.ToString(dr0["DOC_CLASS"]).Trim();
                if (dr0["VENDOR_CODE"] != DBNull.Value) VendorCode = Convert.ToString(dr0["VENDOR_CODE"]).Trim();
                if (dr0["VENDOR_NAME"] != DBNull.Value) VendorName = Convert.ToString(dr0["VENDOR_NAME"]).Trim();
                if (dr0["NET_AMT"] != DBNull.Value) NetAmount = Convert.ToString(dr0["NET_AMT"]).Trim();


                if (dr0["VOUCHER_CREATED_BY"] != DBNull.Value) VoucherCreatedBy = Convert.ToString(dr0["VOUCHER_CREATED_BY"]).Trim();
                if (dr0["VOUCHER_TYPE"] != DBNull.Value) VoucherType = Convert.ToString(dr0["VOUCHER_TYPE"]).Trim();
                if (dr0["UNIT_NAME"] != DBNull.Value) Unit = Convert.ToString(dr0["UNIT_NAME"]).Trim();

                if (dr0["AUTHORIZED_BY_ID"] != DBNull.Value) AuthorizedById = Convert.ToInt32(dr0["AUTHORIZED_BY_ID"]);
                if (dr0["AUTHORIZED_BY"] != DBNull.Value) AuthorizedBy = Convert.ToString(dr0["AUTHORIZED_BY"]).Trim();
                if (dr0["AUTHORIZED_ON"] != DBNull.Value) AuthorizedOn = Convert.ToString(dr0["AUTHORIZED_ON"]).Trim();
                if (dr0["AUTHORIZED_REMARKS"] != DBNull.Value) AuthorizedRemarks = Convert.ToString(dr0["AUTHORIZED_REMARKS"]);

                if (dr0["APPROVED_BY_ID"] != DBNull.Value) ApprovedById = Convert.ToInt32(dr0["APPROVED_BY_ID"]);
                if (dr0["APPROVED_BY"] != DBNull.Value) ApprovedBy = Convert.ToString(dr0["APPROVED_BY"]).Trim();
                if (dr0["APPROVED_ON"] != DBNull.Value) ApprovedOn = Convert.ToString(dr0["APPROVED_ON"]).Trim();
                if (dr0["APPROVED_REMARKS"] != DBNull.Value) ApprovedRemarks = Convert.ToString(dr0["APPROVED_REMARKS"]).Trim();
            }

            string htmlText = string.Empty;
            htmlText = string.Empty;
            StringBuilder sb = new StringBuilder();


            sb.Append("<h2 class='headerStyle'><u>VOUCHER COPY</u></h2>\n");
            sb.Append("<hr />\n");
            sb.Append("<table class='tblheader'>\n");

            sb.Append("<tr>\n");
            sb.Append("<td class='td1header'>Voucher No.:</td>\n");
            sb.Append("<td class='td2header'><b>{#VoucherNo#}</b></td>\n");
            sb.Append("<td class='td1header'>Voucher Date:</td>\n");
            sb.Append("<td class='td2header'>{#VoucherDate#}</td>\n");
            sb.Append("</tr>\n");

            sb.Append("<tr>\n");
            sb.Append("<td class='td1header'>Challan No.:</td>\n");
            sb.Append("<td class='td2header'><b>{#ChallanNo#}</b></td>\n");
            sb.Append("<td class='td1header'>Challan Date:</td>\n");
            sb.Append("<td class='td2header'>{#ChallanDate#}</td>\n");
            sb.Append("</tr>\n");

            sb.Append("<tr>\n");
            sb.Append("<td class='td1header'>Purchase Order No.:</td>\n");
            sb.Append("<td class='td2header'><b>{#PurchaseOrderNo#}</b></td>\n");
            sb.Append("<td class='td1header'>Purchase Order Date:</td>\n");
            sb.Append("<td class='td2header'>{#PurchaseOrderDate#}</td>\n");
            sb.Append("</tr>\n");

            sb.Append("<tr>\n");
            sb.Append("<td class='td1header'>Vendor Code:</td>\n");
            sb.Append("<td class='td2header'><b>{#VendorCode#}</b></td>\n");
            sb.Append("<td class='td1header'>Vendor Name:</td>\n");
            sb.Append("<td class='td2header'>{#VendorName#}</td>\n");
            sb.Append("</tr>\n");

            sb.Append("<tr>\n");
            sb.Append("<td class='td1header'>DOC Class:</td>\n");
            sb.Append("<td class='td2header'><b>{#DOCClass#}</b></td>\n");
            sb.Append("<td class='td1header'>Net Amount:</td>\n");
            sb.Append("<td class='td2header'>{#NetAmount#}</td>\n");
            sb.Append("</tr>\n");


            sb.Append("<tr>\n");
            sb.Append("<td class='td1header'>Voucher Created By:</td>\n");
            sb.Append("<td class='td2header'><b>{#VoucherCreatedBy#}</b></td>\n");
            sb.Append("<td class='td1header'>Voucher Type:</td>\n");
            sb.Append("<td class='td2header'>{#VoucherType#}</td>\n");
            sb.Append("</tr>\n");

            sb.Append("<tr>\n");
            sb.Append("<td class='td1header'>Unit:</td>\n");
            sb.Append("<td class='td2header'>{#Unit#}</td>\n");
            sb.Append("</tr>\n");



            sb.Append("</table>\n");

            sb.Replace("{#VoucherNo#}", VoucherNo);
            sb.Replace("{#VoucherDate#}", VoucherDate);
            sb.Replace("{#ChallanNo#}", ChallanNo);
            sb.Replace("{#ChallanDate#}", ChallanDate);
            sb.Replace("{#PurchaseOrderNo#}", PurchaseOrderNo);
            sb.Replace("{#PurchaseOrderDate#}", PurchaseOrderDate);
            sb.Replace("{#VendorName#}", VendorName);
            sb.Replace("{#DOCClass#}", DOCClass);
            sb.Replace("{#VendorCode#}", VendorCode);
            sb.Replace("{#NetAmount#}", NetAmount);
            sb.Replace("{#VoucherCreatedBy#}", VoucherCreatedBy);
            sb.Replace("{#Unit#}", Unit);


            //VOUCHER DETAILS START[===========================]

            int srNo = 0;

            if (dsDetails.Tables[1].Rows.Count > 0)
            {
                sb.Append("<h3 class='header2'>Voucher Details</h3>\n");

                sb.Append("<table class='tblsubitems'>\n");

                sb.Append("<tr class='trsubitems'>\n");

                sb.Append("<th class='tdsrno'>Sr.No.</th>\n");

                sb.Append("<th class='tdtag'>GL Code</th>\n");
                sb.Append("<th class='tddesc'>GL Description</th>\n");
                sb.Append("<th class='tdtag'>Class</th>\n");
                sb.Append("<th class='tdtag'>Product Code</th>\n");
                sb.Append("<th class='tddesc'>Product Description</th>\n");
                sb.Append("<th class='tddesc'>UOM</th>\n");
                sb.Append("<th class='tdquantity'>Quantity</th>\n");
                sb.Append("<th class='tddesc'>Rate</th>\n");
                sb.Append("<th class='tdquantity'>Amount</th>\n");
                sb.Append("</tr>\n");

                foreach (DataRow dr in dsDetails.Tables[1].Rows)
                {
                    srNo++;
                    sb.Append("<tr>\n");
                    sb.Append("<td class='tdsrno'>{#SRNo#}</td>\n");

                    sb.Append("<td class='tdtag'>{#GLCode#}</td>\n");
                    sb.Append("<td class='tddesc'>{#GLDescription#}</td>\n");
                    sb.Append("<td class='tdtag'>{#Class#}</td>\n");
                    sb.Append("<td class='tdtag'>{#ProductCode#}</td>\n");
                    sb.Append("<td class='tddesc'>{#ProductDescription#}</td>\n");
                    sb.Append("<td class='tddesc'>{#UOM#}</td>\n");
                    sb.Append("<td class='tdquantity'>{#Quantity#}</td>\n");
                    sb.Append("<td class='tddesc'>{#Rate#}</td>\n");
                    sb.Append("<td class='tdquantity'>{#Amount#}</td>\n");
                    sb.Append("</tr>\n");


                    sb.Replace("{#SRNo#}", Convert.ToString(srNo));

                    sb.Replace("{#GLCode#}", Convert.ToString(dr["GLCODE"]));
                    sb.Replace("{#GLDescription#}", Convert.ToString(dr["GL_DESCRIPTION"]));
                    sb.Replace("{#Class#}", Convert.ToString(dr["CLASS"]));
                    sb.Replace("{#ProductCode#}", Convert.ToString(dr["PRODUCT_CODE"]));
                    sb.Replace("{#ProductDescription#}", Convert.ToString(dr["PRODUCT_DESCRIPTION"]));
                    sb.Replace("{#UOM#}", Convert.ToString(dr["UOM"]));
                    sb.Replace("{#Quantity#}", Convert.ToString(dr["QUANTITY"]));
                    sb.Replace("{#Rate#}", Convert.ToString(dr["RATE"]));
                    sb.Replace("{#Amount#}", Convert.ToString(dr["AMOUNT"]));
                }
                sb.Append("</table>\n");
            }


            //VOUCHER DETAILS END[===========================]


            //SIGNATORIES DETAILS START[===========================]

            sb.Append("<hr class='hrsignatories' />\n");
            sb.Append("<h3 class='header'>Signatories</h3>\n");

            if (AuthorizedById > 0)
            {
                sb.Append("<hr class='hrsignatories' />\n");
                sb.Append("<fieldset class='pdffieldset'>\n");
                sb.Append("<legend class='pdflegend'>Authorized</legend>\n");
                sb.Append("<table class='tblsignatories'>\n");
                sb.Append("<tr>\n");
                sb.Append("<td colspan='3'>Authorized Remarks:</td>\n");
                sb.Append("<td colspan='3'>&nbsp;</td>\n");
                sb.Append("</tr>\n");
                sb.Append("<tr>\n");
                sb.Append("<td colspan='4'>{#AuthorizedRemarks#}</td>\n");
                sb.Append("</tr>\n");
                sb.Append("<tr><td colspan='4'>&nbsp;</td></tr>\n");
                sb.Append("<tr>\n");
                sb.Append("<td class='tdsignatories1'>Authorized By:</td>\n");
                sb.Append("<td class='tdsignatories2'>{#AuthorizedBy#}</td>\n");
                sb.Append("<td class='tdsignatories1'>Authorized On:</td>\n");
                sb.Append("<td class='tdsignatories2'>{#AuthorizedOn#}</td>\n");
                sb.Append("</tr>\n");
                sb.Append("</table>\n");
                sb.Append("</fieldset>\n");

                sb.Replace("{#AuthorizedRemarks#}", AuthorizedRemarks);
                sb.Replace("{#AuthorizedBy#}", AuthorizedBy);
                sb.Replace("{#AuthorizedOn#}", AuthorizedOn);

            }


            if (ApprovedById > 0)
            {
                sb.Append("<hr class='hrsignatories' />\n");
                sb.Append("<fieldset class='pdffieldset'>\n");
                sb.Append("<legend class='pdflegend'>Approved</legend>\n");
                sb.Append("<table class='tblsignatories'>\n");
                sb.Append("<tr>\n");
                sb.Append("<td colspan='3'>Approved Remarks:</td>\n");
                sb.Append("<td colspan='3'>&nbsp;</td>\n");
                sb.Append("</tr>\n");
                sb.Append("<tr>\n");
                sb.Append("<td colspan='4'>{#ApprovedRemarks#}</td>\n");
                sb.Append("</tr>\n");
                sb.Append("<tr><td colspan='4'>&nbsp;</td></tr>\n");
                sb.Append("<tr>\n");
                sb.Append("<td class='tdsignatories1'>Approved By:</td>\n");
                sb.Append("<td class='tdsignatories2'>{#ApprovedBy#}</td>\n");
                sb.Append("<td class='tdsignatories1'>Approved On:</td>\n");
                sb.Append("<td class='tdsignatories2'>{#ApprovedOn#}</td>\n");
                sb.Append("</tr>\n");
                sb.Append("</table>\n");
                sb.Append("</fieldset>\n");

                sb.Replace("{#ApprovedRemarks#}", ApprovedRemarks);
                sb.Replace("{#ApprovedBy#}", ApprovedBy);
                sb.Replace("{#ApprovedOn#}", ApprovedOn);

            }

            //SIGNATORIES DETAILS END[===========================]


            htmlText = sb.ToString();
            return htmlText;

        }
        catch (Exception ex)
        {
            return null;
        }
    }
}

