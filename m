From: Michal =?iso-8859-2?q?Kube=E8ek?= <mkubecek@suse.cz>
Subject: Re: How to block ssh on specific ethernet interface
Date: Fri, 14 Oct 2011 09:33:46 +0200
Message-ID: <201110140933.46546.mkubecek@suse.cz>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com> <CAHEKYV4jyZdRVyzsbpDbzVfLBSqruAPYguU4gqiBviKPqevxbA@mail.gmail.com> <A5D3AC0FAABBF34A9FD613C14AAC59B71F8F52@sonusinmail02.sonusnet.com>
Reply-To: mkubecek@suse.cz
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8F52@sonusinmail02.sonusnet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Friday 14 of October 2011, Netravali Ganesh wrote:
> Anyone have any idea if there is any internal routing of packets
> happens from eth0 to eth1 when we configure both the interface for
> same subnet IP ?

If a packet with our address as destination (more precisely, a packet=20
for which a route with type local is selected) arrives on any interface=
,=20
it is processed as incoming packet (and goes to INPUT chain in filter=20
table). It doesn't matter whether the address is set on the interface=20
which the packet arrived on or to any other interface.

More interesting question is why did the packet arrive at eth0 but to=20
answer this we would have to know more about the configuration and=20
network topology.

> > #Use these options to restrict which interfaces/protocols sshd will
> > bind to ListenAddress ::
> > ListenAddress 0.0.0.0
=2E..
> That said, here is a bit of a tangent question: which one is more
> efficient/uses less resources: blocking at the iptables lever or past
> it, at the sshd level?

This is similar: ListenAddress directive only binds the socket to=20
certain address so that the socket accepts only packets with this=20
destination address. But if the address is correct, it doesn't matter o=
n=20
which interface the packet came.

> And would both approaches show port 22 on eth1 as closed?

This depends on what exactly is meant by "show as closed".

                                                         Michal Kube=E8=
ek

