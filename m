From: Marc Perkel <marc@perkel.com>
Subject: Port Forwarding Help
Date: Thu, 27 Jan 2005 15:50:37 -0800
Message-ID: <41F97E4D.2090709@perkel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I hope this is the right list. I need help.

This is something that should be simple for all you smart people out there.

I have 2 email servers that I want to communicate with each other. Both 
have port 25 open. But - they only bind on port 25 to specific IP 
addresses. So - what I want to do is this:

I want to do an ssh tunnel to the other server. SSH doesn't do that 
gracefully - but I did get it to work listening on port 26 and piping to 
port 25.

ssh -f -N -C -L 26:localhost:25 destination

So - here's what I want to do. I want to port forward 1 ip address on 
port 25 on the local machine to port 26 so for example :

127.0.0.2 on port 25 to 127.0.0.2 on port 26 so if I connect to 
127.0.0.2 on port 25 it goes over the tunnel to the other server.

It can be that hard - but I'm just not very smart.

Thanks in advance for your help.

-- 
Marc Perkel - marc@perkel.com

Spam Filter: http://www.junkemailfilter.com
    My Blog: http://marc.perkel.com
My Religion: http://www.churchofreality.org
~ "If it's real - we believe in it!" ~



