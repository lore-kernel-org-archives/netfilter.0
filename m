From: "Shaun T. Erickson" <sterickson@gmail.com>
Subject: Re: Iptables & ftp (no natting or forwarding)
Date: Mon, 16 Oct 2006 16:06:38 -0400
Message-ID: <92da24e00610161306i18236db0k625771c2ea82541@mail.gmail.com>
References: <5.1.0.14.2.20061016144543.020d1678@129.6.16.94>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20061016144543.020d1678@129.6.16.94>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joe Matusiewicz <joem@nist.gov>
Cc: netfilter@lists.netfilter.org

On 10/16/06, Joe Matusiewicz <joem@nist.gov> wrote:
> At 02:35 PM 10/16/2006, Shaun T. Erickson wrote:
> >
> >How do I configure iptables to allow active or passive ftp
> >connections, while poking the least amount of holes in the firewall?
>
> Loading these two modules got passive ftp to work for me:
>
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_nat_ftp

Thanks. It turns out all I had to do was open up tcp port 21 and load
the ip_conntrack_ftp module and then it just worked in both active and
passive modes.

    -ste

