From: Ard van Breemen <ard@telegraafnet.nl>
Subject: Re: ip_conntrack
Date: Mon, 25 Nov 2002 16:44:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021125154423.GA30721@telegraafnet.nl>
References: <200211251200.gAPC0d408705@mailgate.mailbox.co.za>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200211251200.gAPC0d408705@mailgate.mailbox.co.za>
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
Content-Transfer-Encoding: 7bit
To: Warren P <warrenp@websurfer.co.za>
Cc: netfilter@lists.netfilter.org

On Mon, Nov 25, 2002 at 02:00:41PM +0200, Warren P wrote:
> I'm receiving the following messages in /var/log/messages
> kernel: ip_conntrack: table full, dropping packet.
> My ip_conntrack_max = 65528.
> I'm running a squid proxy and the messages did not bother me, until
> last few days, when the proxy's responses deteriated heavily.
> If ip_conntrack is the causing the problem, please indicate as to how
> I determine what the prefered size of ip_conntrack_max should be
> considering that I have 1gig of RAM in the machine.
insmod ip_conntrack hashsize=4194304

If you have a lot of different connections, you do not want to be
stuck with 8192 buckets. It will get your system cpu up to
100%...
This way, you free your CPU, and it will allow you to have
9gigabyte worth of connections ... :-)
Anyway, adjust the hashsize to something that fits the use. The
hashsize I use above is for a core firewall only. But it does a
lot of connection tracking...
-- 
procedure signature;
begin  { telegraaf.com
} writeln('<ard@telegraafnet.nl> SMA-IS | Geeks don't get viruses');
end

