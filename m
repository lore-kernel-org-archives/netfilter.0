From: Scott MacKay <scottmackay@yahoo.com>
Subject: RE: Mangling problem
Date: Wed, 21 May 2003 07:02:17 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030521140217.69906.qmail@web13904.mail.yahoo.com>
References: <06f501c31f9c$9f34e930$7035a8c0@hoeschen>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <06f501c31f9c$9f34e930$7035a8c0@hoeschen>
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

My believe too.  iptables is not a promiscious app; it
handles packets which come in/go out of the device. 
You see the broadcast because it is 'intended' for
Computer B (and any other computer).  
The only way B would get it is if Computer A
transmitted the packets to computer B (either directly
or because B was a router).

One question:  How does computer A get the video? 
internal capture or is the data being sent to it? 

-Scott

--- Chris Hoeschen <chris.hoeschen@primevest.com>
wrote:
> I maybe wrong but I don't believe netfilter will
> process any packets not
> intended for that box.  TCPDump will see it as in a
> hubbed environment
> all nodes receive all packets but only those that
> are destined for that
> box will netfilter process.
> 


__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

