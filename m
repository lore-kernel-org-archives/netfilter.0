From: "antonio.dibacco" <antonio.dibacco@aruba.it>
Subject: Re: Routing through PtP and iptables
Date: Sat, 13 May 2006 12:41:25 GMT
Message-ID: <20060513124125.7833.qmail@mx1.aruba.it>
References: <000601c67679$67d1c940$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_0_7819_1147524085";
	charset="iso-8859-1"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000601c67679$67d1c940$0101000a@sterenborg.info> 
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

This is a MIME-formatted message.  If you see this text it means that your
mail software cannot handle MIME-formatted messages.

--=_0_7819_1147524085
Content-Type: text/plain; format=flowed; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

The two boxes will never be placed on the same LAN.

Thank you for your attention 

Rob Sterenborg Scrive: 

> netfilter-bounces@lists.netfilter.org scribbled on : 
> 
>> Hi all, 
>> 
>> I have two identical linux boxes (A e B), each one with two
>> interfaces: an ethernet (eth0 with ip 192.168.1.50) and an hdlc
>> (hdlc0). The two boxes are only connected via a link through their
>> hdlc interfaces. Because they have to be  exactly the same, if I have
>> to assign an ip address to hdlc0 of A then the hdlc0 of B should have
>> the same ip address. Each one should have a default route that cannot
>> coincide with the hdlc interface. Every linux box has a web server.
>> When I connect with my notebook to box A I want to reach the web
>> server on A typing in my browser http://192.168.1.50 and I want to
>> reach web server on B typing http://192.168.1.50:8080 . 
>> Some one knows how could it be possible? 
>> 
>> Thank you for your help,
>> Antonio.
> 
> If Server A has IP 192.168.1.50, you *cannot* have a server B also on
> 192.168.1.50 in the samen LAN. You would have 1 IP address for multiple
> servers and that just isn't going to work. 
> 
> What you *can* do is :
> Server A = 192.168.1.50
> Server B = 192.168.1.51
> Forward requests to 192.168.1.50:8080 to 192.168.1.51(:8080 or whatever
> you like) 
> 
> 
> Gr,
> Rob 
> 
> 
 

--=_0_7819_1147524085--

