From: "=?ISO-8859-1?Q?Gwenha=EBl_Pasquiers?=" <gegefr@gmail.com>
Subject: Captive portal and DNAT
Date: Mon, 17 Dec 2007 15:41:10 +0100
Message-ID: <47050bf90712170641h7cdcf7f5kfe352a999a60beb3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=vBZeGRfMB35Q91kuwPZAka0vXnATSZAi0Y3UYfYtstg=;
        b=Mvnu1+QZaPalgPo7Wlp6aXMoToe5GVVgfKOm5tgF69NWGbsCq87M+P+fP9S2xsCe5P/lhu3sphfmJy+Bnpu4SDloT9eY0I2ThfnJHcp7mSlIMHVKdZ8oDEZGthlVQ5L8/DgAHo/mDh/Dwfi7aYY5QMgWNy/F0P0a4fuO0XQ3Qb0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm facing an issue while trying to make a captive protal using iptables.

marked packets in mangle PREROUTING should be normally forwarded.
unmarked packets in mangle should be dropped or DNATed to my http portal.

I'm using DNAT + SNAT on unmarked packets  to redirect to my portal.

I'm forwarding marked packets with SNAT.

The problem is that the NAT connection stays active even if the
packets of this connection are marked and do not .

In that case, when refreshing the page, the browser use the same TCP
connection that is still DNATed to my captive portal. I'd like it not
to be forwarded anymore.

I suppose the problem comes from the fact that only the first packet
of the connection goes through the nat table.

Is there a way , in the mangle table, to modify chosen packets in
order for them not to go through that connection ?

Thanks in advance.
