From: Evan Davies <evand@voiceplus.com.au>
Subject: PPTP server + Firewall + PPTP VPN Masq through firewall
Date: 01 Jul 2003 12:10:03 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057025403.4161.20.camel@proto.voiceplus.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_fileserver.voiceplus.com.au-21007-1057025406-0001-2"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter <netfilter@lists.netfilter.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_fileserver.voiceplus.com.au-21007-1057025406-0001-2
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Hi All,

I was wondering if the following was possible:

Windows Client
PPTP VPN Client  ----\
                                  \
Linux Client ---------->------> FIREWALL + PPTP Server --- INTERNET
----- FIREWALL + PPTP Server
                                   /                              |
Windows Client ------/                                |
                                                                   |
                                                            Home User
PPTP VPN


I can have the Firewall/ VPN server work correctly in that the home user
can connect. But the internal PPTP client  cannont make a connection out
through the firewall.

I turn the VPN server off and adjust the iptables rules so incoming 47
connections are blocked and the internal PPTP client connects no
problems to another external pptp server.

Is i possible to have both connections running ?

I'm using RH 8.0 with iptables 1.2.7a + pptp_connection tracking module
is compiled into the kernel but not as a module.

Can anyone give me an example of an iptables script to do this


Any help would be greatly appreciated


-- 
Evan Davies <evand@voiceplus.com.au>

--=_fileserver.voiceplus.com.au-21007-1057025406-0001-2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.5">
</HEAD>
<BODY>
Hi All,<BR>
<BR>
I was wondering if the following was possible:<BR>
<BR>
Windows Client<BR>
PPTP VPN Client&nbsp; ----\<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<BR>
Linux Client ----------&gt;------&gt; FIREWALL + PPTP Server --- INTERNET ----- FIREWALL + PPTP Server<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>
Windows Client ------/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Home User PPTP VPN<BR>
<BR>
<BR>
I can have the Firewall/ VPN server work correctly in that the home user can connect. But the internal PPTP client&nbsp; cannont make a connection out through the firewall.<BR>
<BR>
I turn the VPN server off and adjust the iptables rules so incoming 47 connections are blocked and the internal PPTP client connects no problems to another external pptp server.<BR>
<BR>
Is i possible to have both connections running ?<BR>
<BR>
I'm using RH 8.0 with iptables 1.2.7a + pptp_connection tracking module is compiled into the kernel but not as a module.<BR>
<BR>
Can anyone give me an example of an iptables script to do this<BR>
<BR>
<BR>
Any help would be greatly appreciated<BR>
<BR>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<BR>
</TD>
</TR>
</TABLE>
<BR>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
-- <BR>
Evan Davies &lt;<A HREF="mailto:evand@voiceplus.com.au"><U>evand@voiceplus.com.au</U></A>&gt;
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=_fileserver.voiceplus.com.au-21007-1057025406-0001-2--

