From: "Brendan Grieve" <brendan_200108@grieve.com.au>
Subject: [Announcement]: Web Statistics Frontend for ulacc
Date: Sat, 11 May 2002 18:01:46 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <001101c1f8d2$dc8f3d40$641410ac@cat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi All,

I've sat down and written up some Traffic Accounting Software for some of my
clients. This part of it is the Web Front End that they see. I thought this
would be
of interest to some of you.

If you prefer to see a working (sane chrooted) example, click through to:
http://www.worldguard.com.au/cgi-bin/ipacc

Here is an except from my README file: -

ipacc
-----

---------------------------------------------------------------------------
1. What is it?
---------------------------------------------------------------------------

This piece of software has been designed to run with my Traffic Account
Module written for ULOGd. Therefore I shall start off by giving a quote
from its documentation: -

  As part of my UAS software suite (Users Aren't Stupid), I have a Traffic
  Accounting module for use with Harald Welte's ulog netfilter target.
  (http://www.gnumonks.org/cgi-bin/cvsweb.cgi/ulog). I've been looking for
  a decent 2.4 Kernel traffic accounting module for a while and gave up and
  wrote my own.

  This module has one fairly interesting feature. Most networks that I
  administrate are generally quite dynamic. That is, all the workstations
  on it are assigned their network details and IP Address via DHCP. As some
  of my clients wished to have accounting down to the workstation detail,
  I've made this particular module use a mixture of the IP and MAC. This
  means that if a workstation gets a new IP, it will still have traffic
  statistics applied correctly to it. If more than one IP has the same MAC,
  as when they are behind a router, then accounting will still work, but
  will only give totals for all addresses. This means I'm trusting the MAC
  rather than the IP, and I am using two tables, one to store MAC's and one
  to store IP's, with a relationship of one MAC to many IP's. NOTE: Both a
  MAC and IP_can_ be forged, but this is a topic for another discussion.

------8< Snip of Documentation on how it does this ---- 8< -----------

    * It would be fairly simple to write a web front-end that parses
      the file and links MAC to machine names.

ipacc is essentially the 'web front-end' that parses in the logfile and
gives a user friendly report. There's not terribly much more to comment
on it, apart from the fact that its taken hours of work and I'm very
pleased to FINALLY finish it.


---------------------------------------------------------------------------
2. How do I Compile it?
---------------------------------------------------------------------------

Hopefully this is fairly simple. I'll just give some step-by-step
instructions: -

1. Uncompressed archive to some directory.

2. Copy examples/ipacc.conf to /etc, and modify it.

3. Ensure ipaccount.log exists. Touch it if not. Did I mention that you
   should also have already set up my ulogd_ACCOUNT module?

4. Create a new group 'ipacc' and add the user the webserver runs under
   to it. On my system I added the following entry to my /etc/group
        ipacc:x:22:httpd

5. Set relevant modes on the config file and logfile dir. On mine I went: -
        chown root.root /etc/ipacc.conf && chmod u=rw,g=r,o=r
/etc/ipacc.conf
        chown root.ipacc /var/log/ipacc && chmod u=rwx,g=rx,o=
/var/log/ipacc
        chown root.root /var/log/ipacc/* && chmod 644 /var/log/ipacc/*

6. Compile it. Should be as simple as going 'make' in the directory.

7. Copy the binary 'ipacc' to your cgi-bin directory. On my system it
   was /usr/shared/httpd/cgi-bin, and make sure the webserver has perms
   to run it. ie: -
        install -o root -g ipacc -m 750 ipacc /usr/shared/httpd/cgi-bin

8. Copy the icons directory to your webserver icons directory, or set up
your
   web server such that http://localhost/icons/ipacc/blah.jpg will read
   the picture. Make sure permissions are correctly set.

Done!

---------------------------------------------------------------------------
3. ipacc.conf
---------------------------------------------------------------------------

The config file is fairly simple (I hope). It is based around having groups
of options. For instance, if a company has 20 computers, and those 20
computers belong to 3 departments, it would make sense to create three
groups, and stick the relevant computers into their relevant group. That
way each department can pay for their internet usage.

There is also one 'special' group called 'GLOBAL'. This simply holds a few
global variables for use in configuring the software. It can also hold
'default' values for some variables.

A typical options file will look like: -

    group GLOBAL {
        # Comment - Global Options set here
    }

    group R&D {
        # Custom group called R&D
        host 00:43:21:59:22:0d "Hawk Eye"
        host 00:43:21:59:0d:16 "Eagle Eye"
    }

    group OTHER {
        # I like to put unknowns in their own group
        accept_unknown 1
    }

A list of all the current variables are as follows. A [G] means it can be
set in the GLOBAL group. A [C] means it can be set in a custom group.

accept_unknown	[C]
	Someone brings in their notebook from home and plugs in. They will
	register as an unknown MAC address. Who should account for this
	traffic? This option sets a group to 'accept' unknown MAC address
	traffic.
	Values can be 0 or 1

cost_per_meg	[C][G]
	When enabling cost estimation, this option specifies how much each
	meg over and beyond 'initial_traffic' costs.
	Value is a float/real.

cosT_per_month	[C][G]
	When enabling cost estimation, this option specifies how much per
	month you have to pay minimum.
	Value is a float/real

estimate_cost	[G]
	Use this option to enable cost estimation. The software will try to
	work out how much you are paying for bandwith. It uses the highest
	of upload or download.
	Value can be 0 or 1

host		[C]
	This gives a MAC address a name. Whenever the MAC address is seen in
	the logs, it will now be assigned to this group, and given a more
	friendly name.
	Value is of the form:     MACADDRESS FRIENDLYNAME

ipaccountlog	[G]
	Where can the ipaccount log be found.
	Value is a string

initial_traffic	[C][G]
	When cost estimation is enabled, what initial traffic do you get
	before you have to start paying per megabyte.

keepstats_days	[G]
	NOT USED YET - This field will specify how long to keep statistics in
	the 'watermark' files. This way you can rotate and delete the larger
	uLOG file without losing history.

keepstats_size	[G]
	NOT USED YET - This field will specify the maxium size the 'watermark'
	file can be. This was you can rotate and delete the larger ULOG file
	without losing history.

percent_total	[G]
	When enabled, certain columns will appear on some reports showing the
	percentage bandwith used of the TOTAL bandwith for that month by
	a group(s)/computer. This way, if it says 'R&D' is using 35% of the
	bandwith, they can pay for 35% of the total cost. Use this rather than
	relying on Cost Estimation to be totally accurate.


---------------------------------------------------------------------------
4. What is 'Automatic'
---------------------------------------------------------------------------
Before I forget I'll just explain Automatic (Found on the report).
I've actually written an IP account report before for clients of mine.
It was based on ipchains and used the 'counter' for a chain. It was a huge
big ugly hack but it worked, and I loathed every character of it.

When I updated to my much nicer cleaner interface, I found that my new
interface just didn't feel as inuitive. Sometimes I want to sort by
Computer, and sometime by date. So I created an 'Automatic' sort that
emulates my old interface's method of sorting. It uses the following rules:

 - No Month or Group Selected
    - Show by Date
 - A month selected, but no Group/Computer
    - Show by Group (for that month)
 - No month selected, but a group/computer selected
    - Show by date (for that group/computer)
 - Both a month and group selected
    - Show by Group (A list of Computers in the group, for that Month)

This was a nice clean hack :-)

---------------------------------------------------------------------------
5. TO DO
---------------------------------------------------------------------------
Not much really. I would like to implement a 'watermark' file that stores
the 'parsed' ULOG file. This way the Ulog file can be safely deleted, and
a date/size can be set on how long to keep old history.


---------------------------------------------------------------------------
6. Contact/Download Details
---------------------------------------------------------------------------
My name is Brendan Grieve. I hope someone finds some use for this software
or can modify to their needs.

Official Download Location: http://www.worldguard.com.au/projects/ipacc
My Email:  brendan (@) worldguard.com.au

Stay well. God Bless!




