From: "Alexander Konovalenko" <a-konovalenko@yandex.ru>
Subject: Re: Major NAT Problem
Date: Wed, 11 Feb 2004 18:40:48 +0300 (MSK)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <402A4D00.000013.05317@tide.yandex.ru>
References: <Sea2-F19kyCKDkb9pPF00000901@hotmail.com> <008c01c3f036$90067b70$0200000a@heretic>
Reply-To: a-konovalenko@yandex.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008c01c3f036$90067b70$0200000a@heretic>
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
To: alexis@attla.net.ar
Cc: netfilter@lists.netfilter.org

>You have 2 options
>
>1- disable pmtud in the lan boxes and decrease the mtu (begin with 1490 and
>no more of 1400) and test it.
>2- make linux to announce an mss of 1450 (commonly mtu-20)
>
>(let me know if you need the theory applied to it)

I'm very interested in the details.  Is there any documentation that explains why this is so?

Thank you!

  -- Alexander Konovalenko

