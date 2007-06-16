From: "Mohammad Norouzi" <mnrz57@gmail.com>
Subject: regarding iptables and DROP
Date: Sat, 16 Jun 2007 15:49:51 +0330
Message-ID: <34b8543c0706160519g4c238ffdkc867eac3eff5990c@mail.gmail.com>
References: <34b8543c0706160514g966862cj31dddbdd9cbc7da9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=NNsp/eYYG+XLuEu26Jy6Wpiv0x/qLjWzayyUX/LI9AziG2k0xgOYxXC3KyckIeDBhNrq4VRb9gqBf5rn+RP2QyGpYukXx4tOOzLZbl4IvqmCCPXHrObt8ity0lXdlPfB7Tm/SQU8jzobNsc/rUJKBwjtF50j2yGGl9RJXEhuPVQ=
In-Reply-To: <34b8543c0706160514g966862cj31dddbdd9cbc7da9@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello
I am new to this mailing list, I have a problem with iptables configuration

I have an iptables file with following content:

[I just briefed the content]
--------------------------
:PREROUTING ACCEPT [831:64633]
:POSTROUTING ACCEPT [20:1927]
:OUTPUT ACCEPT [11:1333]


-A POSTROUTING -s 192.168.0.1 -o eth1 -j MASQUERADE   # LINE 1
-A PREROUTING  -s 192.168.0.1  -p tcp -m mac --mac-source !
00:30:48:54:AA:5A  -j DROP  #LINE 2
------------------------------

at first it was just "LINE 1" but soon I figured out that some users
cloning the existing IPs and try to connect to the internet. so I
added the "LINE 2" to match their MAC Address and drop the packets if
it isnt original.

but now it seems that internet pages loading speed is diminished, I
think this action (adding line 2) caused  checking packets too much
and that is why the it is slowed down.

my question is if there is another way to determine the cloned IPs and
drop them.
is REJECTING faster than DROP? if yes how to use REJECT option ?

any suggestion would be of a great help.

thank you very much in advance.



-- 
Regards,
Mohammad
--------------------------
see my blog: http://brainable.blogspot.com/
another in Persian: http://fekre-motefavet.blogspot.com/

