From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: VPN behind Linux Firewall
Date: Mon, 24 Jun 2002 18:09:08 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206241709.SAA16948@slate.rockstone.co.uk>
References: <00ff01c21b9e$fafe0790$0327a8c0@kayegee> <200206241657.RAA16900@slate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206241657.RAA16900@slate.rockstone.co.uk>
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

On Monday 24 June 2002 5:57 pm, Antony Stone wrote:

> I think it might be interesting to add a logging rule, or use tcpdump /
> ethereal etc, to look for UDP packets from source port 500 to source port
> 500, and see if these appear soon before the connection goes downj ?

Obviously that was supposed to read "...look for UDP packets from source port 
500 to destination port 500..."

> UDP 500 is the Internet Key Exchange (IKE) protocol, and the two end
> systems might be trying to re-key (although 10-15 minutes is a bit quick),
> and something might be blocking that ?
>
> Just a thought.
>
>
>
> Antony.

