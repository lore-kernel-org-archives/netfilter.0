From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: A simple question
Date: Thu, 19 Aug 2004 07:04:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512A7@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hi,
>
> In almost all IP Tables articles I've found that the default policy of
> all tables (INPUT,OUTPUT,FORWARD) set to DROP.  I can understand it as
> far as INPUT and FORWARD tables are concerned, but I do not understand
> why should we set the default policy of OUTPUT chain to DROP.  OUTPUT
> chain is responsible for packets originating from the firewall itself.
> Whay should we DROP it?
>
> Thanks,
> Sudheer

two reasons i can think of:

1) your firewall is no better than any other machine in your network.  =
all of the machines behind it are only allowed out on specific ports to =
specific destinations, so why should the firewall be any different?

2) it helps lazy admins (i.e. me).  on more than one occasion i've found =
myself ssh'ed into a firewall and tried to go somewhere/do something and =
it didn't work; and i thought to myself "i probably shouldn't be doing =
this from the firewall."  it keeps you from treating the machine that is =
supposed to be the most locked down, tightly secured machine in the =
network like a common client.  for me anyways...

i only allow out ftp or http to the specific IP's of the machines that i =
update from (via apt or yum).

-j


