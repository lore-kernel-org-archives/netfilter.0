From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: please explain "--state RELATED/ESTABLISHED" rules in iptables
Date: Fri, 21 Jun 2002 16:39:22 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206211539.g5LFdWU03215@vulcan.rissington.net>
References: <20020621083307.B21833@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020621083307.B21833@spawar.navy.mil>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Friday 21 June 2002 4:33 pm, Christian Seberino wrote:

> My firewall iptables script has rules
> to drop lots of packets and only forward
> certain packets.....
>
> I've seen lots of iptables scripts that
> have rules with "--state RELATED"
> and "--state ESTABLISHED".
>
> I know these have to do with TCP packets
> related to an existing TCP connection and such.
>
> *What* are these rules good for?  I didn't
> use them and couldn't see a need for them.

http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7.html#ss7.3

Look down until you find "the state match" section.

 

Antony

