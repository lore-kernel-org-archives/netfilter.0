From: "Udo Rader" <spamtrash2@vibe.ac>
Subject: DNAT possible with the string module?
Date: Mon, 04 Nov 2002 16:40:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <aq64dg$4br$1@hermes.vibe.ac>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi,

I would like to do the following thing:

2 daemons listening on different ports (lets say 1234 and 2345). 

The firewall then ideally takes all connects from clients to port 1234, 
looks for a "magic string" (using -m string) in the packages and based 
upon the (non)existance of the string finally decides, which daemon to 
forward the connect to.

... is there a chance for this to work?
... or any other ways to achieve this?

thanks for your work!!!

udo

