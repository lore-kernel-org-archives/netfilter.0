From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: transparent proxy whith DNAT
Date: Wed, 4 Sep 2002 21:11:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020904201109.CJIO290.mta02-svc.ntlworld.com@there>
References: <14C5057BC852D611BAC400E0299AA10FC938@MAILSERV>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <14C5057BC852D611BAC400E0299AA10FC938@MAILSERV>
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

On Wednesday 04 September 2002 6:43 pm, MOUDARIR Mohamed wrote:

> I get a proxy error when i try to get to web from a pc in my private lan

Reply packets come back to the client from the wrong address.   The client 
(browser) doesn't like this so it gives you an error.

Here's why:

1. Internal client sends http request to external address.
2. Firewall translates external address to internal address and sends packet 
to server.
3. Server responds and sends reply back to source address of the request.
4. Source address is on local network, therefore reply goes direct from 
server to client without going through firewall.
5. No reverse NAT occurs, so client gets reply from a different address than 
it sent the request to.

Easiest and best solution is to place web server in DMZ network so that it 
never gets a request from a local client.

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics


