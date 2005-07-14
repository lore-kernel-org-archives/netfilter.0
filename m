From: "curby ." <curby.public@gmail.com>
Subject: Re: size of recent blacklist
Date: Thu, 14 Jul 2005 09:17:51 -0600
Message-ID: <5d2f379105071408175d0318a5@mail.gmail.com>
References: <41DFFDDA1C6.000004DBinnocent.evil@inbox.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DFFDDA1C6.000004DBinnocent.evil@inbox.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On 7/11/05, Innocent Evil <innocent.evil@inbox.com> wrote:
> Also,  I have 'feature request'
> It would be nicer to able to see the blacklist by a command like:
> iptables -m recent --blacklist

On some Linuxes, to display the members of recent list RLIST, you can run

cat /proc/net/ipt_recent/RLIST

