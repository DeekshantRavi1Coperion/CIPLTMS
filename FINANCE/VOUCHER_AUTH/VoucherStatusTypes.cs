using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for VoucherStatusTypes
/// </summary>
public class VoucherStatusTypes
{
    public enum EnumStatus : int
    {
        Open = 0,
        Authorized = 1,
        Approved = 2
    }

    public enum EnumVoucherTypes : int
    {
        JV = 1,
        PV = 2
    }
}