From: Admin <admin@dwvc.org>
Subject: Port forwarding data channel
Date: Tue, 25 Jun 2002 21:01:03 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <E58F686B-886D-11D6-A435-000A2791C930@dwvc.org>
Mime-Version: 1.0 (Apple Message framework v482)
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi, I have no idea if if this is possible or not, but I would appreciate 
some suggestions:

I have a server running inside our LAN and I want to be able to connect 
to a particular daemon on this server, listening on port 5432, from 
outside the LAN through the firewall.
I've set up port forwarding to DNAT traffic destined for this port to 
the LAN server. This works fine however the application opens up a 
second 'data channel' similar to port based ftp but between two 
unprivileged ports on the client and server.
Is there any way to cater for this secondary connection and also do the 
DNAT ?
Thanks
Phill


