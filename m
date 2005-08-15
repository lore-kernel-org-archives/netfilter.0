From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables permission problem in perl scripts
Date: Mon, 15 Aug 2005 00:47:16 -0500
Message-ID: <43002C64.3040101@riverviewtech.net>
References: <3115d56e05081400344964ebcd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e05081400344964ebcd@mail.gmail.com>
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

Can we get an ls -l of the files in question?  What is the user that the web server is running as?



Grant. . . .

afshin lamei wrote:
> Dear all,
> I have a cgi script, which uses some perl scripts in which i'm running
> iptables command using "system" function, like this:
> myfile.pl:
> ......
> system("iptables -F FORWARD")
> ......
> 
> the cgi file is owned by root/root and is run by user nobody.
> myfile.pl is owned by root/root, and I've it setuid (chmod u+s
> myfile.pl ; chown root:nobody myfile.pl) to be able to run iptable
> commands, but it returns this error:
> /////
> modprobe: Can't locate module ip_tables.
> iptables v1.2.11: can't initialize iptables table `nat': Permission
> denied (you must be root) perhaps iptables or your kernel needs to be
> upgraded.
> /////
> what's the solution?
> thanks a lot
> afshin lame


