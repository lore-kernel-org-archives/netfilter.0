From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: Hack or what?
Date: Tue, 17 Sep 2002 17:48:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c25e61$9ee128b0$026410ac@honor>
References: <1032252934.9317.6.camel@rayw>
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
To: Raymond Leach <raymondl@knowledgefactory.co.za>, netfilter@lists.samba.org

looks like you got whatever app running on 10.0.0.4 that tries to retrieve
or send files via tftp to that other IP address.

might be some virii trying to update its own code remotly, or whatever..
check 10.0.0.4 (must be an internal machine due to private ip range) what
processes are running and do some netstat -na to check open connections.


