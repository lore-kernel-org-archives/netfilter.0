From: slack geek <slack_geek@mail.bulgaria.com>
Subject: Re: internal web server
Date: Fri, 5 Sep 2003 17:32:05 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905173205.23f32681.slack_geek@mail.bulgaria.com>
References: <F22386C3FEB012449238672E38ED61E70A8CA2@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E70A8CA2@overlord.overturemedia.com>
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
To: netfilter@lists.netfilter.org

Hello fritz,

You have only one mistake in your iptables command. Since you're making DNAT and you're refering to firewall's _external_ ip to connect 
to to the internal web server, it's right to do it like this:

EXT_IFACE = your external network interface ( eth0 for example )
EXT_IP = the ip address attached to your $EXT_IFACE
INT_WWW_IP = your web server ip address

iptables -t nat -A PREROUTING -p tcp -i $EXT_IFACE -d $EXT_IP --dport 80 -j DNAT --to-destination $INT_WWW_IP:80


Cheers, train.

On Fri, 5 Sep 2003 20:57:51 +0800
"Fritz Mesedilla" <fritz.mesedilla@overturemedia.com> wrote:

> 
> Greetings!
> I can't seem to make this work...
> 
> - external ip of firewall 202.138.128.xxx
> - internal ip of firewall 192.168.247.3
> - internal web server with ip 192.168.247.5
> 
> This was what my code was...
> $IPT -t nat -A PREROUTING -p tcp -d 192.168.247.3 --dport 80 -j DNAT --to-destination 192.168.247.5:80
> 
> It doesn't seem to work. I have set the web server to use the gw of 192.168.247.3
> 
> 
> Hope you can help me. Thanks.
> 
> fritz <www.mesedilla.com>
> ---
> + Basta Ikaw Lord
> 
> ----------------------------------------------------------------------
> This email and any files transmitted with it are confidential and
> intended solely for the use of the individual or entity to whom they
> are addressed. If you have received this email in error please notify
> the sender immediately by e-mail and delete this e-mail from your
> system. Please note that any views or opinions presented in this
> email are solely those of the author and do not necessarily represent
> those of the company. Finally, the recipient should check this email
> and any attachments for the presence of viruses. The company accepts
> no liability for any damage caused by any virus transmitted by this
> email. 
> 
> Overture Media, Inc.
> Direct Line: (632) 635-4785
> Trunkline:   (632) 631-8971 Local 146
> Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., Quezon City 1100
> 
> 



