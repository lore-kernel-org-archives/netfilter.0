From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: (no subject)
Date: Wed, 10 Jul 2002 13:50:52 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02071013505202.04513@Lms>
References: <9AB58396B028D411B2110050040C7AD80173CEED@pc213-104.indigo.ie>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <9AB58396B028D411B2110050040C7AD80173CEED@pc213-104.indigo.ie>
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
To: Niall Murphy <nmurphy@viking.ie>, netfilter@lists.samba.org

On Wednesday 10 July 2002 12:37, Niall Murphy wrote:
> another logging question......for linux RH 7.2
> my logs are mailed to root on a daily basis where and how can i change it
> so logs such as /var/log/messages are mailed to me on an hourly basis????

Perhaps this question should be in another mailing list, but check the system 
crontab files /etc/crontab, /etc/cron.daily, /etc/cron.hourly etc.

You may want to move stuff from one file to another.

Jan Humme.

