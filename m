From: Gary Metcalf <gtm@lou-telecom.net>
Subject: ftp
Date: Wed, 30 Jul 2003 16:30:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F282AEF.5000106@lou-telecom.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

I set my INPUT tables to DROP all tcp entries. Before that line I put in 
some ports to ACCEPT such as port 80 for http. This works as I had a 
friend run nmap to my ip and it came back with all blocked except for 
port 80. He could also get my Web page via a browser. I Have one problem 
still. When I try to ftp out to a site, and I don't have any entries in 
OUTPUT, I can get loged in but if I enter any command such as 'ls' or 
'?' I get the message back that 200 PORT command successfull but I never 
see the list of files or commands. It's like my commands go out but any 
messages returned are blocked. I can't even execute a 'bye' command and 
get out. What port do I need opened up to use ftp from my computer to 
another.
  I tried ports 20, 21, 25,69 and 115 but they did no good. I found 
these in the /etc/services file.
Gary


