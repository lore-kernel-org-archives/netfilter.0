From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: howto only allow outgoing mail from certain hosts
Date: Tue, 01 Oct 2002 17:38:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D99C173.4090601@prosyst.com>
References: <1100D69203AAD2118E3C00508B8B9E8A67F000@mailhost.intech.unu.edu>
Mime-Version: 1.0
Content-Type: multipart/related;
 boundary="------------010209060102070805060108"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


--------------010209060102070805060108
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

   If I understood the problem correctly you must use the following

   iptables -A FORWARD -s x.x.x.a -p tcp --dport 25 -j ACCEPT
   iptables -A FORWARD -s x.x.x.b -p tcp --dport 25 -j ACCEPT

   iptables -A FORWARD -s x.x.x.0/24 -p tcp --dport 25 -j  REJECT

   Or if you have more than two host you want to gran SMTP access put 
the following into a script:
    ...
    #Here you could add as much as you need IP addresses or hostnames 
separated by space
    allowed_smpt="x.x.x.a   x.x.x.b   x.x.x.c   x.x.x.d"
        for allowed in $allowed_smpt
    do
       iptables -A FORWARD -s $allowed -p tcp --dport 25 -j ACCEPT
    done

    iptables -A FORWARD -s x.x.x.0/24 -p tcp --dport 25 -j REJECT
    ...

Hope this will help
Regards :)

Heupink, Mourik Jan C. wrote:

>Hello all.
>
>The subject says it all, really. I want to (of course) allow OUTGOING mail
>from our domain, from only two designated servers. So, drop outgoing mail
>from any other host.
>
>I can't seem to produce the iptables command to get this to work... (using
>forward chain, because using transp. bridging firewall...)
>
>I guess this: iptables -A FORWARD -s x.x.x.0/24 -p tcp --dport 25 -REJECT
>would drop all outgoing mail, right? (i guess the way to select outgoing
>mail traffic would be to use --dport..?)
>
>Now i have to find a way to make an exclusion in that rule. something like
>-s x.x.x.0/24 EXCEPT x.x.x.y
>
>Could anyone shed some light onto this..?
>
>Thanks very much in advance,
>Yours,
>Mourik Jan
>
>
>
>
>  
>



--------------010209060102070805060108--


