From: =?iso-8859-1?q?Christof=20Nyffenegger?= <cnyf@yahoo.de>
Subject: unexpected behaviour...?
Date: Sat, 23 Aug 2003 00:42:41 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030822224241.97443.qmail@web21408.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello

We're in trouble with our brand new linux hot standby firewall cluster. it =

consists of two machines connected to four networks in total. we are about =
to=20
migrate several connections to external networks to this environment and
tested the setup, i.e. the failover functionality which is provided by=20
heartbeat 1.0.1-27 (rpm from SuSE 8.2). the firewall nodes are SuSE 8.2 wit=
h=20
kernel 2.4.20. shown below is the test setup:


                ---------
               |         |
               | ssh/ftp |
               | server  |
                ---------
               192.168.2.50
                    |
    /---------------------------------------------------/ DMZ2
        |                     |                     |
        | - - - - - - - -192.168.2.3- - - - - - - - |
   192.168.2.1                                 192.168.2.2
    ---------                                   ---------
   |         |                                 |         |
   |  FW A   |                                 |  FW B   |
   |         |                                 |         |
    ---------                                   ---------
   192.168.1.1                                 192.168.1.2
        | - - - - - - - -192.168.1.3- - - - - - - - |
        |                    |                      |
    /---------------------------------------------------/ DMZ 1
                                          |
                                     192.168.1.50
                                      ---------
                                     |         |
                                     | ssh/ftp |
                                     | client  |
                                      ---------


- FW A has physical adresses 192.168.1.1 and 192.168.2.1
- FW B has physical adresses 192.168.1.2 and 192.168.2.2
- the cluster service adresses of DMZ 1 and DMZ 2 are
  192.168.1.3 and 192.168.2.3 resp.
- the default gateway on the client is 192.168.1.3
- the server has 192.168.2.3 as its default gateway
- the ruleset is built with fwbuilder 1.0.10
- the rules all have stateful inspection enabled
- established and related connections are accepted prior to first
  rule

test scenario:

- FW A is the active node (it has the service adresses 192.168.1.3
  and 192.168.2.3 rsp.)
- the client initiates an ssh connection to the ssh server in DMZ 2
- the client initiates an ftp connection to the ftp server in DMZ 2
- the client initiates a http donwload over the proxy server
  -> on FW A, the connections appear in the connection table
- failover: the service adresses are moved to FW B, heartbeat does a=20
  gratuitous arp
- additionally, the interfaces on FW A are disabled manually
  (just to make things clear...)

now one would expect all the sessions to freeze immediately after failover.
this is the case indeed with the ftp session and the http download - they
freeze to ice because FW B has no established sessions in its connection ta=
ble
when it acquires the service adresses and the connections are routed throug=
h it
(after the gratuitous arp from heartbeat). but surpise - the ssh session=20
survives the failover. a few seconds after the failover it shows up in the =

connection table on FW B as an established session. Hmm.

this behaviour was reproduced at will, and we were running sniffers during
consecutive tests. the sniffer logs showed no new ssh session setup after
the failover took place, there was no new tcp handshake or so. the session
just continued as if nothing ever happened.

am i getting something wrong? or is this the expected behaviour?

Christof


__________________________________________________________________

Gesendet von Yahoo! Mail - http://mail.yahoo.de
Logos und Klingelt=F6ne f=FCrs Handy bei http://sms.yahoo.de

