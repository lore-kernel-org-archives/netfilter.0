From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables from cgi script
Date: Tue, 3 Jun 2003 16:32:21 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D9A@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Allan Kissack <lists@kissack.freeserve.co.uk>, netfilter@lists.netfilter.org

run a crontab which updates a file... eg.

#vi /etc/crontab
*/5 * * * * root /sbin/iptables -L -v -n -x > =
/home/httpd/html/iptablesrules.txt

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Allan Kissack [mailto:lists@kissack.freeserve.co.uk]
Sent: Tuesday, June 03, 2003 5:28 PM
To: George Vieira; netfilter@lists.netfilter.org
Subject: Re: iptables from cgi script


>----- Original Message -----
>From: "George Vieira" <georgev@citadelcomputer.com.au>
>To: "Allan Kissack" <lists@kissack.freeserve.co.uk>;
<netfilter@lists.netfilter.org>
>Sent: Monday, June 02, 2003 10:33 PM
>Subject: RE: iptables from cgi script
>

> No your not missing anything.. But I like this idea for the fact that
someone who wants to maliciously attack your site and also open your
firewall if the commands can be run by other than root..
>
> Your only (more secure) option is to authenticate the users and allow =
them
to write the rules required to a file or a database and get root to read
these and apply them in a seperate process..
>
>
> or just use webmin ;) www.webmin.com
>
> Thanks,
> ____________________________________________
> George Vieira


Thanks George,
I already use webmin for admin, and write the rules via a command line.
What I am looking for is a cgi script that displays the results of
/sbin/iptables -L -n -v and allows no other iptables commands.  This web
server is protected from the outside by the iptables and is for =
convenient
monitoring internally (ie dont need to go to a command line).  Do you =
knwo
of a way I can allow this?  The script works except for the "can't
initialize iptables table `filter': Permission denied (you must be root)
Perhaps iptables or your kernel needs to be upgraded."  security issue

--
Allan



