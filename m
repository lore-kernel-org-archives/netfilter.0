From: haynes george <hmg_u@yahoo.co.in>
Subject: Help with Raw Sockets Programming
Date: Tue, 26 Jul 2005 08:11:56 +0100 (BST)
Message-ID: <20050726071156.99767.qmail@web8402.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi...

I was going thru some network programming tutorials
and i found a section on raw sockets programming..

I understood what raw sockets are... and i started to
search for some examples related to raw socket
programming..

All examples that i found were the kind of ping server
or something of that sort...
What i am looking for is an example where our prgm
runs as a server and it outputs all packets of a
particluar protocol (eg: TCP) recieved on the host on
which this server is running

I even tried to code this but i failed... This is what
i did

   


#.........

/** All the necessary headers **/

main()
{
       int sockfd;
      struct sockaddr_in myaddr;


      if( ( sockfd = socket (
PF_INET,SOCK_RAW,IPPROTO_TCP ) ) < 0 ) {
                                perror("SOCKET");
                                exit(1);
      }

//Whether we should bind or not ... i have a doubt 
// Anyway i didnot 
// The tutorial said that as all IP packets with the
protocol field as that set to the protocol
//field of the socket() call will be given to the raw
socket..


.// So now i read from the socket using the function
call recvfrom() as this is a 
//connectionless setup
//Is there a need to setup any fields of remoteaddr
???

while( recvfrom ( sockfd, buffer , 4096 ,0 ,  (struct
sockaddr *)&remoteaddr , sizeof(struct sockaddr )) >
0)

{
       printf("caught packet.. %s",buffer);

}
perror("RECVFROM");
return 0;

}




On running the above code it gave an error with the
recvfrom() function

   

 RECVFROM: Operation on non-socket type





How can i modify the above code so that it recieves
all TCP packets that arrive on the host and prints
them out....

The tutorial i was reading said that the kernel
forwards all packets to the raw socket which has the
protocol number matching as that of the IP datagram
which the host recieved. So shouldn't this print all
tcp packets that arrive at the host ??




thnks

haynes


		
__________________________________________________________
How much free photo storage do you get? Store your friends 'n family snaps for FREE with Yahoo! Photos http://in.photos.yahoo.com

