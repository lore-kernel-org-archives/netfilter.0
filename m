From: Fabiano Bonin <fabiano@personalsoft.com.br>
Subject: Redirecting traffic from a interface to antoher
Date: Tue, 23 Mar 2004 16:08:19 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40608B23.2040605@personalsoft.com.br>
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
To: netfilter@lists.netfilter.org

I don't know if this is the right place to ask this. If it's not, please 
point me the right place.

I have a sshd daemon running on a server (called SERVER) in my network 
(called INSIDENET).
In another network (called OUTSIDENET) , i have a client which connects 
to SERVER via ssh protocol, oppening a port (5050) on SERVER that 
redirects to some host on OUTSIDENET network, all via SSH protocol.
This way, if a connect to SERVER, port 5050, i will be automatically 
redirected to an specified host in OUTSIDENET.

This is the output of 'netstat -n -a -p | grep 5050', typed in SERVER:
tcp        0      0 127.0.0.1:5050          0.0.0.0:*               
LISTEN      22522/1

Well, ssh protocol open the port 5050 just on the local interface, so i 
can't connect from a host of INSIDENET to this port on i.e. ETH0.

I'd like to know if there is a way to accept connection in the same port 
but in anoter interface (i.e. ETH0) and redirect this traffic to the 
local interface (127.0.0.1)

Thanks.


