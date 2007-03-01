From: dhottinger@harrisonburg.k12.va.us
Subject: Re: redirect to proxy servere
Date: Thu, 01 Mar 2007 08:50:19 -0500
Message-ID: <20070301085019.ie8pp1zmqso8sssw@webmail.harrisonburg.k12.va.us>
References: <20070301071927.klbsuhgk2sscscs8@mail.harrisonburg.k12.va.us>
	<Pine.LNX.4.61.0703011359540.23355@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0703011359540.23355@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Same ruleset Ive been using for 3 years with no issues.  I just would =20
like to have any traffic going to apples update site go straight there =20
without being redirected to my proxy.

thanks,
ddh


Quoting Jan Engelhardt <jengelh@linux01.gwdg.de>:

>
> On Mar 1 2007 07:19, dhottinger@harrisonburg.k12.va.us wrote:
>>
>> I currently redirect all port 80 traffic to my squid proxy server with
>> following:
>>
>> $IPC -A TOSERVERS -p tcp --dport 8080 -d 204.111.40.10 -i $L3 -j LACCEPT
>> $IPC -A TOSERVERS -p tcp --dport 8080 -d 204.111.40.10 -i $L3 -j LACCEPT
>> $IPC -A TOSERVERS -p tcp --dport 9011:9015 -d 204.111.40.10 -i $L3  =20
>> -j LACCEPT
>> $IPC -A TOSERVERS -p tcp --dport 10000 -d 204.111.40.10 -i $L3 -j LACCEPT
>>
>> Works great, except all of a sudden my apple computers wont do software
>> updates.  So, I would like to not redirect traffic that is destined for
>> apple.com or swscan.apple.com's website.  Im not quite sure of the  =20
>> syntax for
>> my rule, or if this is even possible.  Any ideas?
>
> Perhaps the problem is not in the "TOSERVERS" chain but the "LACCEPT" one.
> Or even somewhere else in the iptables ruleset.
>
>
>
> Jan
> --
>



--=20
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools


