From: Michael Montero <mmontero@mail.communityconnect.com>
Subject: nslookup vs. dig
Date: Tue, 4 Jun 2002 15:35:23 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.04.10206041528470.15358-100000@lysa>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Anyone know why the following might happen:

I run nslookup and I get something like:
	temporary failure in name resolution

Then I run dig on a few domains and suddenly nslookup works fine.  However
after a while, nslookup starts to fail again.  Essentially this is causing
a lot of problems on my firewall box.  Things start failing left and right
because look ups don't seem to work properly.  Has anyone experience this
before?

I hate to have to run a cron that every minute digs a few domains.  For
now, that's what I've resolved to doing and I hate it!  Any help would be
appreciated.



