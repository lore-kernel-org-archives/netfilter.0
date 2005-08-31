From: =?ISO-8859-15?Q?St=E9phane_BENOLIEL?= <sbenoliel@aacom.fr>
Subject: Re: Source NAT
Date: Wed, 31 Aug 2005 13:31:22 +0200
Message-ID: <4315950A.4000300@aacom.fr>
References: <58867.212.100.225.55.1125487119.squirrel@webmail.*>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050606070303060004040808"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <58867.212.100.225.55.1125487119.squirrel@webmail.*>
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
To: Jimmy <squid@oranged.to>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------050606070303060004040808
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Jimmy wrote:

>Hello,
>
>I currently have a situation that I am hoping iptables can resolve. The
>issue is that I need to NAT the source address based on the destination
>address. Is that possible with IPTables ?
>
>For example
>
>if dst = 1.1.1.1 src = 10.1.1.1
>if dst = 1.1.2.1 src = 10.1.1.2
>  
>
You can use DNAT
for exemple:

iptables -t nat -A PREROUTING -s 1.1.1.1 -j DNAT  --to-destination10.1.1.1

>Can anyone give me any advice on completing that?
>
>Regards,
>
>
>
>
>  
>


--------------050606070303060004040808--

