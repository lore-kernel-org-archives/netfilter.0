From: paulc@ibiblio.org
Subject: Re: block kazaa
Date: Tue, 25 Mar 2003 21:27:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030325212147.00ba2e88@mail.clara.net>
References: <20030325183312.2501.87766.Mailman@kashyyyk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030325183312.2501.87766.Mailman@kashyyyk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

The way I block Kazaa (and the other file sharing applications) is a 
blanket ban on all ports by default. I then open the ports as I think is 
appropriate at the firewall. These only include the port 23 for anyone 
wishing to use telnet. All web and ftp style ports on 80, 21 and the like 
are handled by a web-proxy to prevent using them for other purposes. All 
incoming connects (and lots of ICMP messages) are dropped by the firewall also.




