From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: iptables installation problem
Date: 05 Sep 2003 17:57:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062764916.1164.16.camel@india.nsecure.net>
References: <20030905120959.59505.qmail@web20703.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zGyPVg+ir4fN1S8WfTzZ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030905120959.59505.qmail@web20703.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org


--=-zGyPVg+ir4fN1S8WfTzZ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2003-09-05 at 17:39, ads nat wrote:

    Hi,
    It has got following commands :
     
    ***
    iptables --flush
    iptables --table nat --flush
    iptables --delete-chain
    iptables --table nat --delete-chain
    iptables --table nat --append POSTROUTING --out-interface tunnel0 -j
    MASQUERADE
    iptables --append FORWARD --in-interface eth1 -j ACCEPT




    iptables -t -nat -A PREROUTING -p TCP --dport 80 -j REDIRECT
    --to-port 3128


This should be 

    iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT
    --to-port 3128

Make sure that you have removed (-) from -nat above. This is a syntax
error.

Regards
Dharmendra T.

    ***
     Thanks
     
     
    "Dharmendra.T" <dharmu@nsecure.net> wrote:

        Hi, 
        
        On Fri, 2003-09-05 at 16:47, ads nat wrote: 

            Hi,
            I am trying to install iptables-1.2.8.tar.bz2 on Linux 8.0
            server.
            I have downloaded iptables-1.2.8.tar.bz2 file from netfilter
            downloads to /root/iptables-1.2.8 directory. 
            by using command 
            "tar -xf iptables-1.2.8.tar"
            it has created iptables-1.2.8 directory in which all files
            are extracted.

        After this you have to compile the iptables. 

             
            I don't know how to go further.
            I tried make and make install.
             
            Then when i gave command "/etc/rc.d/rc.local"
            it gives following error.

        Tell me what this file contais. Is this a script which has
        iptables rules?

            "[root@xyz iptables-1.2.8]# /etc/rc.d/rc.local
            SIOCDELRT: No such process
            RTNETLINK answers: File exists
            SIOCADDRT: File exists
            SIOCADDRT: File exists
            iptables v1.2.6a: can't initialize iptables table `-nat':
            Table does not exist (do you need to insmod?)
            Perhaps iptables or your kernel needs to be upgraded.
             
            How to go ahead now?
             
            Thanks
            
            
            
            
            ____________________________________________________________
            Do you Yahoo!?
            Yahoo! SiteBuilder - Free, easy-to-use web site design
            software

        -- 
        Regards
        Dharmendra.T
        dharmu@nsecure.net
        
        This message is intended for the addressee only. It may contain
        privileged or Confidential information. If you have received
        this message in error,please notify the sender and destroy the
        message immediately.Unauthorised use or reproduction of this
        message is strictly prohibited.

    
    ____________________________________________________________________
    Do you Yahoo!?
    Yahoo! SiteBuilder - Free, easy-to-use web site design software

-- 
Regards
Dharmendra.T
dharmu@nsecure.net

This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-zGyPVg+ir4fN1S8WfTzZ
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Fri, 2003-09-05 at 17:39, ads nat wrote:
    <BLOCKQUOTE>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>Hi,</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>It has got following commands :</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>***</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables --flush</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables --table nat --flush</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables --delete-chain</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables --table nat --delete-chain</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables --table nat --append POSTROUTING --out-interface tunnel0 -j MASQUERADE</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables --append FORWARD --in-interface eth1 -j ACCEPT</FONT></FONT></I>
    </BLOCKQUOTE>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3"></FONT>
    <BLOCKQUOTE>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables -t -nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128</FONT></FONT></I>
    </BLOCKQUOTE>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">This should be </FONT>
    <BLOCKQUOTE>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128</FONT></FONT></I>
    </BLOCKQUOTE>
<FONT SIZE="3">Make sure that you have removed (-) from -nat above. This is a syntax error.</FONT>
<BR>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">Regards</FONT>
<BR>
<FONT SIZE="3">Dharmendra T.</FONT>
    <BLOCKQUOTE>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>***</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;Thanks</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><B><I>&quot;Dharmendra.T&quot; &lt;dharmu@nsecure.net&gt;</FONT></FONT></B></I><FONT COLOR="#73273a"><FONT SIZE="3"><I> wrote:</FONT></FONT></I>
        <BLOCKQUOTE>
        <FONT COLOR="#73273a"><FONT SIZE="3"><I>Hi, </FONT></FONT></I>
        <BR>
        <FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
        <BR>
        <FONT COLOR="#73273a"><FONT SIZE="3"><I>On Fri, 2003-09-05 at 16:47, ads nat wrote: </FONT></FONT></I>
            <BLOCKQUOTE>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>Hi,</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>I am trying to install iptables-1.2.8.tar.bz2 on Linux 8.0 server.</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>I have downloaded iptables-1.2.8.tar.bz2 file from netfilter downloads to /root/iptables-1.2.8 directory. </FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>by using command </FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>&quot;tar -xf iptables-1.2.8.tar&quot;</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>i</FONT></FONT></I><FONT COLOR="#73273a"><FONT SIZE="3"><I>t has created iptables-1.2.8 directory in which all files are extracted.</FONT></FONT></I>
            </BLOCKQUOTE>
        <FONT COLOR="#73273a"><FONT SIZE="3"><I>After this you have to compile the iptables. </FONT></FONT></I>
            <BLOCKQUOTE>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>I don't know how to go further.</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>I tried make and make install.</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>Then when i gave command &quot;/etc/rc.d/rc.local&quot;</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>it gives following error.</FONT></FONT></I>
            </BLOCKQUOTE>
        <FONT COLOR="#73273a"><FONT SIZE="3"><I>Tell me what this file contais. Is this a script which has iptables rules?</FONT></FONT></I>
            <BLOCKQUOTE>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>&quot;[root@xyz iptables-1.2.8]# /etc/rc.d/rc.local</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>SIOCDELRT: No such process</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>RTNETLINK answers: File exists</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>SIOCADDRT: File exists</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>SIOCADDRT: File exists</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables v1.2.6a: can't initialize iptables table `-nat': Table does not exist (do you need to insmod?)</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>Perhaps iptables or your kernel needs to be upgraded.</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>How to go ahead now?</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I>Thanks</FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
            <BR>
            <FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
            <BR>
            
<HR SIZE="1">
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Do you Yahoo!?</FONT></FONT></I>
            <BR>
            <A HREF="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com"><FONT SIZE="3"><I>Yahoo! SiteBuilder</FONT></I></A><FONT COLOR="#73273a"><FONT SIZE="3"><I> - Free, easy-to-use web site design software</FONT></FONT></I>
            </BLOCKQUOTE>
        <TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
</TR>
<TR>
</TR>
<TR>
<TD>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>-- </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Regards</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Dharmendra.T</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>dharmu@nsecure.net</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</FONT></FONT></I></PRE>
</TD>
</TR>
</TABLE>

        </BLOCKQUOTE>
    
<HR SIZE="1">
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Do you Yahoo!?</FONT></FONT></I>
    <BR>
    <A HREF="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com"><FONT SIZE="3"><I>Yahoo! SiteBuilder</FONT></I></A><FONT COLOR="#73273a"><FONT SIZE="3"><I> - Free, easy-to-use web site design software</FONT></FONT></I>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T
dharmu@nsecure.net

This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-zGyPVg+ir4fN1S8WfTzZ--


