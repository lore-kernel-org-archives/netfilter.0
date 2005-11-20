From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: OUTPUT chain, Source Port 80 ---> Destination Port Unprivileged
Date: Sun, 20 Nov 2005 15:23:50 -0500
Message-ID: <20051120202350.GA23429@bostoncoop.net>
References: <4380CABF.2060705@rosi-kessel.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4380CABF.2060705@rosi-kessel.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Nov 20, 2005 at 02:13:03PM -0500, Adam Rosi-Kessel wrote:
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp -s $IPADDR 1024:65535 \
> 		--source-port 80 --destination-port "1024:65535" -j ACCEPT

Oops, that should have been:

iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp -s $IPADDR \
		--source-port 80 --destination-port "1024:65535" -j ACCEPT

I should also mention that I already have an OUTPUT matching rule to
ACCEPT all packets that are established and related. So it would seem
that the additional rule above should be unnecessary, right? But then why
am I seeing dropped OUTPUT packets with SPT=80 and DPT=>1024?
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

