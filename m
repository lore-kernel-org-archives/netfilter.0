From: Primero <primero@fastwebnet.it>
Subject: Re: Ipsec/l2tp
Date: Sat, 03 Jul 2004 13:46:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsaj8azll5vdmd8@smtp.fastwebnet.it>
References: <4FE82EE778704E4D9D31E9CE0BEC1465032312@caf02.caf.local> <200407031213.33996.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407031213.33996.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org


>
> I hope someone else here can now fill in some useful details for you,  
> given
> that you're using 2.6.6
>
> Regards,
>
> Antony.
>

I'm not an expert, but AFAIK and because it works using this way i think  
that in 2.6 the process is very similar.

In 2.6 ipsec imlementation there is no Virtual interface, like ipsec0 or  
everything else, but the packets both encrypted and unencrypted come from  
the same interface , in expample eth0. They traverse netfilter two times,  
like in 2.4 , they get the first time to the INPUT chain, if accepted they  
traverse netfilter again in the normal process.

The reason i mark my packets at the STEP 1 when they come in encrypted is  
because i needed a way to identify packets that arrived ENCRYPTED, get  
decrypted and acceppted by ipsec and that are traversing the netfilter for  
the second time.
This way i can be sure that i handle only packets that have been accepted  
by ipsec and i can feel good :)
  for example, i use ipsec fot my WIFI lan and i have this kind of rules:

1) MANGLE/PREROUTING for packets arriving in esp protocol

iptables -t mangle -a PREROUTING -s $Y_WIFI_HOSTS -i $MY_WIFI_INTERFACE -p  
esp -j MARK --set-mark 10

2) INPUT for packets arriving in esp protocol

iptables -A INPUT -p esp -j ACCEPT

now IPSEC will authenticate and eventually accept the packets

3) INPUT and FORWARD for previously athenticated packets

iptables -A FORWARD -m --mark 10 -j MY_FORWARD_CHAIN
iptables -A INPUT -m --mark 10 -j MY_INPUT_CHAIN



bye



-- 
Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/

