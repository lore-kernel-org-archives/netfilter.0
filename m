From: "Kevin D. White" <web_crawlz@yahoo.com>
Subject: mangle, filter & FORWARD
Date: Mon, 31 May 2004 13:14:12 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040531201412.91688.qmail@web41708.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Does a packet that needs to be forwarded ever hit the
INPUT chain? 
What is the relationship between mangle & filter
tables and the chain FORWARD, are there two FORWARD
chains; one for mangle and one for filter or do they
share the same chain?.  
When is the decision to move the packet out the
internal interface made, or is this something I must
specify?

Links to more documentation are welcome answers, thank
you.



	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

