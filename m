From: =?iso-8859-1?Q?Svavar_=D6rn_Eysteinsson?= <svavar@fiton.is>
Subject: DNAT to another Network?
Date: Wed, 7 Jul 2004 11:51:02 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407071129.i67BTbP22745@ps0.linanet.is>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi everybody.

I have one question about DNAT.

I have a computer foo.com on an ipaddress xxx.xxx.xxx.xxx

Is there any way for me to DNAT all traffic with destination to foo.com
to another server out-of-town, e.g. computer foobar.com with zzz.zzz.zzz.zzz
that
is not on my public network.?



Diagram : (showing where the traffic should go)


Traffic with destination to Computer A

      INTERNET(ISP nr1)   -------INTERNET(ISP nr2)
         |                |         |
         |                |         |
    Network A             |      Network B
         |                |         |
         |                |         |
     Firewall             |    Computer B (final destination)
         |          |-----|
         ->Computer A
         
Best regards,

Svavar O
Reykjvik - Iceland


