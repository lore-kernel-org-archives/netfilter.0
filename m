From: Petr Pisar <xpisar@fi.muni.cz>
Subject: Re: Logging NAT Translations
Date: Sun, 20 May 2007 19:23:35 +0000 (UTC)
Message-ID: <slrnf5181o.lhk.xpisar@album.ics.muni.cz>
References: <ae1f24730705182015j533102bah985e9ad0e905cd2a@mail.gmail.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 2007-05-19, Craig Bernstein <cbernstein@cbernstein.com> wrote:
>
> Is there a way to log connections along with all of their NAT
> translation data?
>
[...]
> /proc/net/ip_conntrack has the information I need, but no way to send
> it to the log it at the beginning and/or end of the session.
>
You can use tool "conntrack" that can almost in real time log conntrack
events like creating new connction or destroying old one.

-- Petr


