From: Dana Bourgeois <em-lists@netgods.us>
Subject: Re: pop3 and dns
Date: Wed, 12 May 2004 12:14:06 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A2777E.4010008@netgods.us>
References: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com>	 <162701c4375d$1f28a4a0$49caa8c0@caris.priv>	 <20040512042251.GB24345@samad.com.au> <1084346112.24001.35.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084346112.24001.35.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>



Ray Leach wrote:
> On Wed, 2004-05-12 at 06:22, Alexander Samad wrote:
> 
>>On Tue, May 11, 2004 at 10:37:36AM -0300, Peter Marshall wrote:
>>
>>>I have an aside question ... Do you need to listen on both tcp and udp port
>>>53 for DNS ?  Can you just listen on the UDP one ?  Does it require both ?
>>>
>>
>>udp for normal requests
>>tcp for zone transfers
> 
> 
> and large answers ...

...where a 'large answer' is usually taken to be a UDP packet of more 
than 512 bytes.


Dana Bourgeois

<snip>


