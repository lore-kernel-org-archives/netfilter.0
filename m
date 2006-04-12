From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: SNAT will not work for Linux clients when using an alias as the
	gatway address
Date: Wed, 12 Apr 2006 11:10:21 -0600
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE125741@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I am working on a project to build a failover gateway system. I have
heartbeat installed to ipfailover the gateway address eth1:0: 10.0.0.1
and it works great. Windows and Mac machines are able to get through the
gateway and receive responses like they should. Linux machines on the
other hand, don't seem to get a response back from the gateway. It's
really odd as I am using DHCP for all the machines. If I set the Linux
gateway to the actual address of the gateway (eth1: 10.0.0.251) it work
fine, but if that machine goes down, the Linux computer can no longer
get through to the rest of the network. Please help as we have to
present this project tomorrow and it's the last problem to overcome.

Thank you,
Robert LeBlanc

