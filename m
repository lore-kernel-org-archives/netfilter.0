From: ads nat <adsnat@yahoo.com>
Subject: Re: Allow only certain ip addresses
Date: Thu, 10 Jun 2004 21:34:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040611043413.12353.qmail@web60407.mail.yahoo.com>
References: <2169.64.2.245.108.1086889175.squirrel@64.2.245.108>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2169.64.2.245.108.1086889175.squirrel@64.2.245.108>
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
To: Jonathan Villa <jvilla@e37.net>, netfilter@lists.netfilter.org

Since you have mysql on the machine.
Create a mysql table containing fields 1) Name of
user, 2) Ip address, 3) Port no. on which he is
allowed and 4)yes/ne key.
Write a php (Or any) script which will generate
required iptables rule and will insert same in
iptables. 
Write another php(or any) Form with which you can
motitor group or single as required.

Hope I have understood your problem properly.
Thanks


--- Jonathan Villa <jvilla@e37.net> wrote:
> I have a machine running mysql only.
> 
> I want to allow connections on ports 3306, 22, and
> 80 for a group of ip
> address.
> 
> Some will be from the block, others are dispersed.
> 
> Will I know how to allow block of ips, and how to
> allow a single ip, how
> would I combine the 2?
> 
> My assumption is this
> 
> 1. create an array of the single ip addresses.
> 2. loop throught the array printing an iptables
> command which will allow
> access on those ports to the loop index.
> 3. hardcode the ip block xx.xxx.xx.0/24
> 
> Am I correct so far?
> 
> 



	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

