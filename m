From: Andreas Stallmann <stallmann@dawin.de>
Subject: Re: ipsec and iptables
Date: Wed, 15 Feb 2006 18:25:26 +0100
Message-ID: <43F36406.9090906@dawin.de>
References: <BAY103-F18B52DF78B9CA5C62F9698B2060@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F18B52DF78B9CA5C62F9698B2060@phx.gbl>
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
To: netfilter@lists.netfilter.org

Hi Marco,

thanks for your help so far. Some additional questions:

Marco Berizzi wrote:
> --tunnel-dst 172.16.1.247 --tunnel-src 172.16.1.226 \
>             ^^^^^^^^^^^               ^^^^^^^^^^^^
> These are the ipsec endpoint addresses (usually public ip addresses)
Can I leave those out? My endpoints do both have dynamical addresses, 
cause one is a roadwarrior, and the other a firewall, which is connected 
to the internet via ADSL and receives a new address each 24h.

Thank you again,

Andreas

-- 
dawin GmbH - Andreas Stallmann - Consultant
Belgische Allee 50 - 53842 Troisdorf
FON +49 (0)2241 / 39 71 98 - 0
FAX +49 (0)2241 / 39 71 98 - 9

