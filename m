From: alan barrow <aaa.coms.sec@btclick.com>
Subject: a discussion starter i hope.
Date: 09 May 2002 21:11:01 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <1020975061.20151.16.camel@sarig.internal>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-v+G1OIkCBdd1oas7NFi4"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org


--=-v+G1OIkCBdd1oas7NFi4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I have been using iptables-netfilter for a while and wish to clarify in
my mind for once how to do the following.

Scenario: An iptables firewall has 2 interfaces, which are a public and
a private interface, for simpilicty's sake. Behind the firewall a
service runs which needs to be visible to the world at large in this
case let's start with an easy one http, on port 80.

No problems so far :)

Now behind the firewall are 2 separate servers, each running a web
service and each running on port 80.

1) The question is, with only 1 real world address available to you,
what suggestions do you guy's have as to the configuration required to
make both web servers available on the Internet ? So that incoming port
80 request on the firewall public interface go to the correct server.

2) The same as scenario 1) except you have 2 addresses available but
only one external NIC.

3) Same as 2) except you have 2 NIC's.

The reason for this is the following is that, i wish to understand if
there is a path to this result. I realise there are probably many way's
to skin this cat, and i have tried a few of them, some of you may
already be doing this, but in my experience there seem to be a lot of
pitfall's and consequently the issues i have faced seem to suggest the
following:

Some think it's possible, Some don't, some wish it was possible, many
just say this way, others suggest that way, many just give up. 

All in all i would like to take this to the logical conclusion of
getting it working in multiple scenarios securely and effectively.

yours a.r.b. 



--=-v+G1OIkCBdd1oas7NFi4
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.2">
</HEAD>
<BODY>
I have been using iptables-netfilter for a while and wish to clarify in my mind for once how to do the following.
<BR>

<BR>
Scenario: An iptables firewall has 2 interfaces, which are a public and a private interface, for simpilicty's sake. Behind the firewall a service runs which needs to be visible to the world at large in this case let's start with an easy one http, on port 80.
<BR>

<BR>
No problems so far :)
<BR>

<BR>
Now behind the firewall are 2 separate servers, each running a web service and each running on port 80.
<BR>

<BR>
1) The question is, with only 1 real world address available to you, what suggestions do you guy's have as to the configuration required to make both web servers available on the Internet ? So that incoming port 80 request on the firewall public interface go to the correct server.
<BR>

<BR>
2) The same as scenario 1) except you have 2 addresses available but only one external NIC.
<BR>

<BR>
3) Same as 2) except you have 2 NIC's.
<BR>

<BR>
The reason for this is the following is that, i wish to understand if there is a path to this result. I realise there are probably many way's to skin this cat, and i have tried a few of them, some of you may already be doing this, but in my experience there seem to be a lot of pitfall's and consequently the issues i have faced seem to suggest the following:
<BR>

<BR>
Some think it's possible, Some don't, some wish it was possible, many just say this way, others suggest that way, many just give up. 
<BR>

<BR>
All in all i would like to take this to the logical conclusion of getting it working in multiple scenarios securely and effectively.
<BR>

<BR>
yours a.r.b. 
<BR>

<BR>

</BODY>
</HTML>

--=-v+G1OIkCBdd1oas7NFi4--


