From: "Sean Donner" <siegex@atozcomp.com>
Subject: Re: iptables and wireless card in promiscuous mode
Date: Wed, 1 Dec 2004 12:14:20 -0800 (PST)
Message-ID: <56366.67.122.205.47.1101932060.squirrel@67.122.205.47>
References: <424BCB4EA242A1429A8AF0548E8CFF0E123999@apexexchange.ApexSoftware.Com>
	<41ADD672.1090303@eurecom.fr>
	<20041201161606.GA971@bender.817west.com>
Reply-To: siegex@atozcomp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041201161606.GA971@bender.817west.com>
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

>> Can anyone tell me how to set up a simple filter using BPF that blocks
>> all the packets coming from a given MAC address?

Out of curiosity what is this BPF you speak of? I googled for it and I
came across "Berkeley Packet Filter" which sounds about on topic with this
mailing list but it seems to be a FreeBSD util.  I did an slocate for it
on my box and it found nothing but a header file.  Is this some
non-standard util has a linux port for link layer filtering?




