From: "Joe Yu" <decade_joe@email.com>
Subject: How to set multi network ip forward ( prerouting )
Date: Fri, 22 Nov 2002 02:47:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021122074712.28320.qmail@email.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Sorry Sir,

I have multi network
Net A : 10.128.0.0/255.255.0.0
Net B : 10.129.0.0/255.255.0.0
Net C : 10.129.0.0/255.255.0.0
Net D : 10.131.0.0/255.255.0.0 
Net E : 10.138.0.0/255.255.0.0 
Net F : 10.192.0.0/255.255.0.0 
Net G : 10.192.0.0/255.255.0.0
Net H : 10.64.0.0/255.255.0.0

I want to set "iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -s -d < Net A,B,C,D,E,F,G,H > -j REDIRECT 8080

How to type multi network setting command 

Thanks

Joe Yu
-- 
_______________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup

One click access to the Top Search Engines
http://www.exactsearchbar.com/mailcom


