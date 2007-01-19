From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: redirecting on a local machine
Date: Fri, 19 Jan 2007 23:23:47 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701192323040.18606@yvahk01.tjqt.qr>
References: <008101c73bf9$dc9d99c0$0700a8c0@stormbook>
	<45B11AF9.8060209@plouf.fr.eu.org>
	<009901c73c02$d046cad0$0700a8c0@stormbook>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <009901c73c02$d046cad0$0700a8c0@stormbook>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: saspan <saspan@web.de>
Cc: netfilter@lists.netfilter.org


On Jan 19 2007 20:48, saspan wrote:
>> > cause a browser would not be expecting a reply from a transparent
>> > proxy when waiting for replies to its requests.
>> 
>> Huh ?
>
> See: The browser sends http-request to e.g. 99.9.9.9.1:80.
> The request is redirected to proxy on 127.0.0.1:3128.
> Browser waits for reply from 99.9.9.9:80.
> Actually the reply will come from proxy on 127.0.0.1:3128.
>
> Do you see the problem?

What, you wanna tell us that there is a way for the browser to directly connect
to the internet? As in... this ascii graph?


      INET
       |
SQUID--+
       |
      BROWSER



	-`J'
-- 

