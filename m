From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: UDP port closed in an http request
Date: Tue, 21 Jan 2003 17:38:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004f01c2c16b$81808460$026410ac@honor>
References: <002101c2c15e$5bb17bc0$0c1ca8c0@LionelDuboeuf>
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
To: Lionel Duboeuf <lionel.duboeuf@adpsa12.org>, netfilter@lists.netfilter.org

From: "Lionel Duboeuf" <lionel.duboeuf@adpsa12.org>

> i can ping 193.252.19.189 but not www.wanadoo.fr
> i can dig or nslookup www.wanadoo.fr which reports me 193.252.19.189
> of course while i'm doing http://193.252.19.189 everythings works fine but
> http://www.wanadoo.fr not.

enigma@gate:/home/enigma > dig www.wanadoo.fr

;; ANSWER SECTION:
www.wanadoo.fr.         86400   IN      A       193.252.19.142

and i can't ping neither the fqdn nor the ip...

enigma@gate:/home/enigma > telnet www.wanadoo.fr 80
Trying 193.252.19.142...
Connected to www.wanadoo.fr.
Escape character is '^]'.
GET / HTTP/1.1
Host: www.wanadoo.fr

HTTP/1.1 200 OK

works like charm here..

maybe got a poisoned ns, or something strange in your hosts file?



