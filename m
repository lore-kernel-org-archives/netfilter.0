From: "Mack" <RAGAN_DAVIS@colstate.edu>
Subject: need some help solving problem
Date: Sat, 29 Mar 2003 12:50:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E859680.19568.5FA7E8@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
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

Hi!

I currently have a rule in my iptables firewall script like this:

iptables -t nat -A PREROUTING -p tcp -s 1.2.3.4 --dport http -j DNAT --to 5.6.7.8:80

This successfully "redirects" a client trying to go to www.somewhere.com and sends 
them to a web site on my webserver, and displays the default web page for that web 
site.  This works fine.  However, this happens on every request from the client.  Is 
there a way to have the prerouting happen only once, and then not happen after 
that?  I'd like to redirect them to a web page that contains news or important 
imformation.  Once they've visited this page, I'd like for them to not see it again until 
later (if ever).  I was looking at the "-m recent" extension, but I'm not sure if this will 
work.

Any ideas/suggestions?

many thanks,
mack


