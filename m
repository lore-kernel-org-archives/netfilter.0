From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: port 8080 and zope woes....
Date: Thu, 11 Sep 2003 17:28:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c37879$5f93e610$0401000a@tanjian>
References: <200309110526.KAA26061@WS0005.indiatimes.com>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309110526.KAA26061@WS0005.indiatimes.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> I have zope server running on port 8080
> and have enabled its access in IPTables
> however it fails to open up.
> any reason why??
>
>  -A INPUT -d <dest-ip> -p tcp -m tcp --dport 8080 -j ACCEPT
>
> -A OUTPUT -s <dest-ip> -p tcp -m tcp --sport 8080 -j ACCEPT

Have you set the default policy of the INPUT chain set to DROP ?
Then do you also have :

-A INPUT -m state --state RELATED,ESTABLISED -j ACCEPT
-A OUTPUT -m state --state RELATED,ESTABLISED -j ACCEPT (if OUTPUT
default policy is DROP)



Gr,
Rob



