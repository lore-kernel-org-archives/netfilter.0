From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Another Hardware Sizing Question
Date: 08 Sep 2003 11:11:27 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062999695.827.19.camel@india.nsecure.net>
References: <3F58B934.3060902@bus.okstate.edu>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-2jEnHMgF7CbVGhZhdStd"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F58B934.3060902@bus.okstate.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jason Joines <joines@bus.okstate.edu>
Cc: netfilter@lists.netfilter.org


--=-2jEnHMgF7CbVGhZhdStd
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2003-09-05 at 21:56, Jason Joines wrote:

       We have a subnet with a potential of 1022 hosts.  Each machine is 
    connected to a 100 Mbps switch.  The connection from our subnet to the 
    main university network is I believe OC-3, ~154 Mbps.  There are 
    currently less than 500 active machines on the network.  They do the 
    normal web brosing, and connect to NetWare and Domino servers outside 
    the subnet.  With that, the maximum traffic we've ever seen between our 
    subnet and the rest of the world is about 40 Mbps.
    
       We'd like to put all the boxes on our subnet behind and IPTables 
    firewall and NAT them.  We'd also like to take into consideration the 
    possibility of the number of machines growing to ~1000.  We have quite a 
    few spare PIII 450 boxes setting around.
    
       What would be the mininum, ideal, etc., hardware setup for this 
    environment.
    
    
    Thanks,
    
    Jason Joines
    Open Source = Open Mind
    ========================
    

Hi,

Ideally if you put p-3 machine with 256MB ram should work in this
situation assuming that you are not running any application on the
firewall other than packet filtering.

    

-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin

--=-2jEnHMgF7CbVGhZhdStd
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Fri, 2003-09-05 at 21:56, Jason Joines wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>   We have a subnet with a potential of 1022 hosts.  Each machine is </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>connected to a 100 Mbps switch.  The connection from our subnet to the </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>main university network is I believe OC-3, ~154 Mbps.  There are </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>currently less than 500 active machines on the network.  They do the </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>normal web brosing, and connect to NetWare and Domino servers outside </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>the subnet.  With that, the maximum traffic we've ever seen between our </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>subnet and the rest of the world is about 40 Mbps.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>   We'd like to put all the boxes on our subnet behind and IPTables </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>firewall and NAT them.  We'd also like to take into consideration the </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>possibility of the number of machines growing to ~1000.  We have quite a </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>few spare PIII 450 boxes setting around.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>   What would be the mininum, ideal, etc., hardware setup for this </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>environment.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Thanks,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Jason Joines</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Open Source = Open Mind</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>========================</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">Hi,</FONT>
<BR>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">Ideally if you put p-3 machine with 256MB ram should work in this situation assuming that you are not running any application on the firewall other than packet filtering.</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-2jEnHMgF7CbVGhZhdStd--


