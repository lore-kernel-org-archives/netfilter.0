From: "David Busby" <busby@pnts.com>
Subject: Re: Understanding Source ports
Date: Tue, 15 Jul 2003 14:57:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004f01c34b1c$16d71df0$1100000a@busbydev>
References: <200307151256.56125.sysadmin_lists@iwa-solutions.com>
Reply-To: "David Busby" <busby@pnts.com>
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
To: System Administrator <sysadmin_lists@iwa-solutions.com>, netfilter@lists.netfilter.org

Leon,
    How the source port on a machine is generated is dependent on the IP
stack.  Some boxes (Win32) I know use incremental (or almost incremental
(x+=2) source ports.  These are allocated by the IP stack when you call
connect().  However on almost every system that supports Berkley Sockets you
can call bind() to have the client socket use a specific IP and PORT
combination on the machine that is originating the connection.  So source
port comes from stack or program.  Source ports are (on *NIX) limited so
that only root can bind to ports <= 1024 (IIRC).

// PERL/Cish psudeocode
// Typical client connection
int sd = socket(PF_INET,SOCK_STREAM,getprotobyname("tcp"));
// Pretend *sin is a packed socket address
// This will make the OS determine my outbound IP and port
connect(sd,*sin,sizeof(*sin));
close(sd);
// Now Pick my port
sd = socket(PF_INET,SOCK_STREAM,getprotobyname("tcp"));
// Assume *lin is a packed local socket address (IP/PORT)
lin.addr = '10.0.0.1';
lin.port = '68';
bind(sd,*lin,sizeof(lin));

Also see
man 2 socket
man 5 protocols
man 3 getprotoent
man 2 connect
man 2 bind
If you have perl try `man 3 Socket`

/B


----- Original Message ----- 
From: "System Administrator" <sysadmin_lists@iwa-solutions.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, July 15, 2003 09:56
Subject: Understanding Source ports


I love my source of information -- Iptables logging feature.  I'm still
learning about but sure beats saying "I donno" to the boss.

It has brought a question i can't answer.  I guess I don't really understand
how packets orginate, in relation to the source port, on a system.  They
seem
to be somewhat random and very definately incremental.

Is there a good FAQ somewhere that I missed?

THNX
-- 
Leon Sonntag
Systems Administrator


