From: Wim Werk <wim@nice.be>
Subject: Re: GRE/PPTP Pass-through problems
Date: Thu, 04 Sep 2003 20:27:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F57842E.8080606@nice.be>
References: <1062692878.965.4.camel@jorgea.calcom.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1062692878.965.4.camel@jorgea.calcom.com.mx>
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
To: Jorge Armando Medina <jmedina@calcom.com.mx>
Cc: netfilter@lists.netfilter.org

Jorge

My connection goes to a windows PPTP server behind the linux box, so there
is no options.pptp. Anyway thanks for your answer.

Note that this worked with a 2.2 kernel with ipchains

Regards
Wim

Jorge Armando Medina wrote:

>I had the same problem, and I solved it putting in my options.pptpd
>configuration file as follow:
>
>lcp-echo-failure 30
>lcp-echo-interval 5
>
>This is to prevent timeouts in the client side, with the
>lcp-echo-faliure  your server send echo request to the clients for
>respons when are an idle time, so you can modify this parameter to a
>higher value.
>
>
>I hope this will solve your problem, well, It was enough for me.
>
>regards.
>
>
>  
>



