From: Koyama Mituru <netfilter@gvelo.ddnn.jp>
Subject: Re: ssh
Date: Wed, 14 Jul 2004 23:25:44 +0900 (JST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040714.232544.78703338.netfilter@gvelo.ddnn.jp>
References: <web-369453423@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-369453423@mail01.infosat.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

From: "IT Clown" <iptables@mailbox.co.za>
Subject: ssh
Date: Wed, 14 Jul 2004 16:15:22 +0200

> How do i allow ssh in from the internet, thanks?

iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT

-- 
Koyama Mituru    netfilter@gvelo.ddnn.jp

