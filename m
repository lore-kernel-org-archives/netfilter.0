From: James Morris <jmorris@intercode.com.au>
Subject: Re: the packet_id field
Date: Wed, 5 Jun 2002 10:21:28 +1000 (EST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Mutt.LNX.4.44.0206051020380.4530-100000@blackbird.intercode.com.au>
References: <F117UsebmspH2q6DqaJ00012036@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <F117UsebmspH2q6DqaJ00012036@hotmail.com>
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
To: waleed usman <waleedu@hotmail.com>
Cc: netfilter@lists.samba.org

On Tue, 4 Jun 2002, waleed usman wrote:

> 
> Does a packet possessing an id == 0 hold any specific meaning??

No, and usually shouldn't exist.

> For every one icmp packet sent through the localhost (using the 'ping' 
> system call) i receive two packets in my userspace QUEUE. WHy is it so???
> 

Ping reply?


- James
-- 
James Morris
<jmorris@intercode.com.au>



